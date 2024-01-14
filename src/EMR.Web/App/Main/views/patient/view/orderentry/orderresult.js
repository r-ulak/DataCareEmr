(function () {
    angular.module("app")
        .factory("OrderResultService",
        [
            "abp.services.app.orderResult", "ImageService", "ProcedureOrderCodeService", "UserService", "TenantService",
            function (orderResultService,
                imageservice,
                procedureOrderCodeService,
                userService,
                tenantService) {
                var orderResultList = [];
                var orderResultListByPid = [];
                var orderResultLabListByPid = [];
                var orderResultRadListByPid = [];
                var cacheExpandedList = [];
                var processingGetOrderResultDataByPid = false;
                var factory = {
                    getOrderResultByOrderId: function (order) {
                        if (order.id === 0) return;
                        abp.ui.setBusy();
                        orderResultService
                            .getOrderResultDetailByOrderId(order)
                            .success(function (result) {
                                for (var i = 0; i < result.length; i++) {
                                    var objGroup = _.find(cacheExpandedList,
                                        function (item) {
                                            return item.longCommonName === result[i].longCommonName;
                                        });
                                    result[i].expanded = _.isUndefined(objGroup) ? false : objGroup.expanded;
                                    orderResultList.push(result[i]);
                                }
                            })
                            .finally(function () {
                                abp.ui.clearBusy();
                            });
                    },
                    getOrderResultByPid: function (pid) {
                        if (processingGetOrderResultDataByPid) return;
                        processingGetOrderResultDataByPid = true;
                        orderResultService
                            .getOrderResultDetailByPid({
                                PatientId: pid
                            })
                            .success(function (result) {
                                for (var i = 0; i < result.length; i++) {
                                    orderResultListByPid.push(result[i]);
                                }
                            }).finally(function () {
                                processingGetOrderResultDataByPid = false;
                                angular.copy([], orderResultRadListByPid);
                                angular.copy([], orderResultLabListByPid);
                                _.each(orderResultListByPid, function (item) {
                                    if (item.isRad) {
                                        orderResultRadListByPid.push(item);
                                    }
                                    else {
                                        orderResultLabListByPid.push(item);
                                    }
                                });
                            });
                    },
                    getOrderResultDataByPid: function (pid, isRad) {
                        angular.copy([], orderResultListByPid);
                        factory.getOrderResultByPid(pid);
                        if (isRad) {
                            return orderResultRadListByPid
                        }
                        else {
                            return orderResultLabListByPid;
                        }
                    },
                    getOrderResultDataByOrderId: function (order) {
                        if (order) {
                            if (_.where(orderResultList, { orderId: order.id }).length === 0)
                                factory.getOrderResultByOrderId(order);
                        }
                        return orderResultList;
                    },
                    clearOrderResultData: function () {
                        angular.copy([], orderResultList);
                    },
                    clearOrderResultDataByorderId: function (orderId) {
                        cacheExpandedList =
                            _.filter(orderResultList, function (order) { return order.orderId === orderId });
                        var index = 0;
                        while (index > -1) {
                            index = _.findIndex(orderResultList, function (order) { return order.orderId === orderId });
                            if (index > -1) {
                                orderResultList.splice(index, 1);
                            }
                        }
                    },
                    createOrderResult: function (orderResult, vm) {
                        if (!vm.canUpdateLabResult) {
                            abp.notify.error(App.localize("Access Denied for create/update"));
                            return;
                        }
                        return orderResultService.createOrderResult(orderResult);
                    },
                    updateOrderResult: function (orderResult, vm) {
                        if (!vm.canUpdateLabResult) {
                            abp.notify.error(App.localize("Access Denied for create/update"));
                            return;
                        }
                        return orderResultService.updateOrderResult(orderResult);
                    },
                    updateAllOrderResult: function (orderResults, vm) {
                        if (!vm.canUpdateLabResult) {
                            abp.notify.error(App.localize("Access Denied for create/update"));
                            return;
                        }
                        if (orderResults.length === 0) return;
                        return orderResultService.updateAllOrderResult(orderResults);
                    },
                    reloadOrderResultByOrderId: function (orderId, pid) {
                        factory.clearOrderResultDataByorderId(orderId);
                        factory.getOrderResultDataByOrderId({
                            id: orderId,
                            patientId: pid
                        });
                    },
                    setupUploadDocs: function (vm) {
                        var documentTable = "DocumentOrderResult";
                        vm.uploadDocs.push(imageservice.uploadDocInfo(documentTable));
                        vm.addUpload = function () {
                            vm.uploadDocs.push(imageservice.uploadDocInfo(documentTable));
                        }
                    },
                    loadCodeTables: function (vm) {
                        vm.administeredByIdCodeData = userService.getAllUsersWithRoleData();
                        vm.administrationSiteData = tenantService.getAdministrationSiteData();
                        vm.resultStatusCodeData = procedureOrderCodeService.getResultStatusCodeData();
                        vm.resultDataCodeData = procedureOrderCodeService.getResultDataCodeData();
                        factory.loadViewCodeTables(vm);
                    },
                    loadViewCodeTables: function (vm) {
                        vm.abnormalCodeData = procedureOrderCodeService.getAbnormalCodeData();
                        vm.unitCodeData = [];
                        vm.canUpdateLabResult = abp.auth.isGranted("Pages.PatientView.LabOrderResult.Write");
                        vm.canSignOffLabResult = abp.auth.isGranted("Pages.PatientView.LabOrderResult.SignOff");
                    },
                    setupAnduploadDocuments: function (vm, orderId, pid) {
                        _.each(vm.uploadDocs,
                            function (document) {
                                document.refrenceTableId = orderId;
                                document.pid = pid;
                            });
                        if (vm.uploadDocs.length === 0) return;
                        imageservice.removeNullUploadDocs(vm.uploadDocs);
                        imageservice.uploadDocuments(vm.uploadDocs);
                    },
                    viewDocImageModal: function (id, $uibModal) {
                        var modalInstance = $uibModal.open({
                            templateUrl: "/App/Main/views/image/viewimage.cshtml",
                            controller: "app.views.image.view as vm",
                            size: "lg",
                            resolve: {
                                param: function () {
                                    return {
                                        'docRequest': {
                                            DocumentXrefId: id,
                                            RefrenceTableName: "DocumentOrderResult"
                                        }
                                    };
                                }
                            }
                        });
                    },
                    openPanelDetailModal: function (orderId, $uibModal, orderResultData) {
                        var modalInstance = $uibModal.open({
                            templateUrl: "/App/Main/views/patient/view/orderentry/orderresult/paneldetail.cshtml",
                            controller: "app.views.patient.order.paneldetails as vm",
                            size: "lg",
                            resolve: {
                                param: function () {
                                    return {
                                        'orderResultData': orderResultData,
                                        'orderId': orderId
                                    };
                                }
                            }
                        })
                    },
                    openOrderDetailModal: function ($uibModal, orderResultData) {
                        var modalInstance = $uibModal.open({
                            templateUrl: "/App/Main/views/patient/view/orderentry/orderresult/paneldetail.cshtml",
                            controller: "app.views.patient.order.orderresultdetails as vm",
                            size: "lg",
                            resolve: {
                                param: function () {
                                    return {
                                        'orderResultData': orderResultData
                                    };
                                }
                            }
                        })
                    }
                }
                return factory;
            }
        ]);
    angular.module("app")
        .controller("app.views.patient.orderResult",
        [
            "$scope", "OrderResultService", "$stateParams", "$uibModal", "StaticProperty",
            function ($scope, orderResultService, $stateParams, $uibModal, staticProperty) {
                var vm = this;
                vm.open = false;
                vm.orderResultData = orderResultService
                    .getOrderResultDataByOrderId(); //Get Reference to array no data pull
                orderResultService.loadViewCodeTables(vm);
                vm.orderId = 0;
                vm.viewResult = function (order, expanded) {
                    if (!expanded) return;
                    vm.orderId = order.id;
                    vm.orderResultData = orderResultService.getOrderResultDataByOrderId({
                        id: order.id,
                        patientId: $stateParams.id
                    });
                    vm.datepickerOption = staticProperty.getDateRangeOption(moment(), order.orderDate);
                };
                vm.openModalEditResult = function (result) {
                    var modalInstance = $uibModal.open({
                        templateUrl: "/App/Main/views/patient/view/orderentry/addeditorderresult.cshtml",
                        controller: "app.views.paitent.updateorderResult as vm",
                        size: "xmd",
                        resolve: {
                            param: function () {
                                return {
                                    'result': result
                                };
                            }
                        }
                    });
                };
                vm.viewImageModal = function (id) {
                    orderResultService.viewDocImageModal(id, $uibModal);
                }

                function getUpdateableOrderResult(orderResults) {
                    var updateableResults = _.filter(orderResults,
                        function (orderResult) {
                            return orderResult.checked === true;
                        });
                    if (updateableResults.length == 0) {
                        abp.notify.warn(App.localize("No test result selected for update"));
                        return updateableResults;
                    }
                    _.each(orderResults,
                        function (updateableResults) {
                            updateableResults.pid = $stateParams.id;
                        });
                    return updateableResults;
                }

                function checkForSignoffOverRide(updateableResults, resultstatus) {
                    if (resultstatus === "signoff") {
                        if ((_.filter(updateableResults,
                                function (orderResult) {
                                    return orderResult.resultData.trim() === "" && orderResult.resultStatusCodeId === 1;
                        })).length >
                            0) {
                            abp.message.confirm(
                                "You have pending status results with no results",
                                "Do you want to mark pending result data as not applicable ?",
                                function (isConfirmed) {
                                    if (isConfirmed) {
                                        _.each(updateableResults,
                                            function (orderResult) {
                                                if (orderResult.resultData.trim() === "") {
                                                    orderResult.resultData = "NOT APPLICABLE";
                                                } orderResult.resultStatusCodeId = 2; //Sign Off
                                            });
                                        updateAllOrderResultStatus(updateableResults, resultstatus);
                                    }
                                });
                            return false;
                        };
                        _.each(updateableResults,
                            function (orderResult) {
                                orderResult.resultStatusCodeId = 2; //Sign Off
                            });
                    } else if (resultstatus === "notapplicable") {
                        _.each(updateableResults,
                            function (orderResult) {
                                if (orderResult.resultData.trim() === "") {
                                    orderResult.resultData = "NOT APPLICABLE";
                                }
                                orderResult.resultStatusCodeId = 4; //Not applicable
                            });
                    }
                    return true;
                }

                vm.saveAllResultCode = function (orderResults) {
                    var updateableResults = getUpdateableOrderResult(orderResults);
                    if (updateableResults.length == 0) return;
                    abp.ui.setBusy();
                    orderResultService.updateAllOrderResult(updateableResults, vm)
                        .success(function () {
                            abp.notify.info(App.localize("SavedSuccessfully"));
                            orderResultService.reloadOrderResultByOrderId(vm.orderId, $stateParams.id);
                        })
                        .finally(function () {
                            abp.ui.clearBusy();
                        });
                }
                vm.saveAllResultStatusCode = function (orderResults, resultstatus) {
                    var updateableResults = getUpdateableOrderResult(orderResults);
                    if (updateableResults.length === 0) return;
                    if (!checkForSignoffOverRide(updateableResults, resultstatus)) return;
                    updateAllOrderResultStatus(updateableResults);
                }

                function updateAllOrderResultStatus(updateableResults) {

                    abp.ui.setBusy();
                    orderResultService.updateAllOrderResult(updateableResults, vm)
                        .success(function () {
                            abp.notify.info(App.localize("SavedSuccessfully"));
                            orderResultService.reloadOrderResultByOrderId(vm.orderId, $stateParams.id);
                        })
                        .finally(function () {
                            abp.ui.clearBusy();
                        });
                }

                vm.checkAll = function (checked, orderResults) {
                    _.each(orderResults,
                        function (orderResult) {
                            if (orderResult.resultStatusCodeId === 1) {
                                orderResult.checked = checked;
                            }
                        });
                }
            }
        ]);
    angular.module("app")
        .controller("app.views.paitent.updateorderResult",
        [
            "$scope", "OrderResultService", "$stateParams", "$uibModalInstance",
            "uibButtonConfig", "param", "StaticProperty", "ImageService",
            function ($scope,
                orderResultService,
                $stateParams,
                $uibModalInstance,
                buttonConfig,
                param,
                staticProperty,
                imageservice) {
                var vm = this;
                buttonConfig.activeClass = "greybg";
                vm.datepickerOption = staticProperty.getDateRangeOption(moment(), moment());
                orderResultService.loadCodeTables(vm);

                vm.orderResult = param.result;
                vm.orderResult.isNew = false;
                vm.orderResult.pid = $stateParams.id;
                $scope.LoincCodeId = " ";
                vm.saveOrderResult = function () {
                    abp.ui.setBusy();
                    orderResultService.updateOrderResult(vm.orderResult, vm)
                        .success(function () {
                            abp.notify.info(App.localize("SavedSuccessfully"));
                            orderResultService.reloadOrderResultByOrderId(vm.orderResult.orderId, $stateParams.id);
                            orderResultService.setupAnduploadDocuments(vm, vm.orderResult.id, $stateParams.id);
                        })
                        .finally(function () {
                            abp.ui.clearBusy();
                        });
                }
                vm.uploadDocs = [];
                $scope.$watch(function (scope) {
                    return scope.vm.uploadDocs.map(function (obj) {
                        return obj.uploadComplete;
                    });
                },
                    function () {
                        if (vm.uploadDocs.length === 0) {
                            $uibModalInstance.close();
                            abp.notify.info(App.localize("UploadedSuccessfully"));
                        }
                        else {
                            imageservice.uploadCompleteUploadDocs(vm.uploadDocs);
                        }
                    },
                    true);
                orderResultService.setupUploadDocs(vm);
                vm.close = function () {
                    $uibModalInstance.dismiss();
                };
            }
        ]);
    angular.module("app")
        .controller("app.views.paitent.addorderResult",
        [
            "$scope", "OrderResultService", "$stateParams", "$uibModalInstance",
            "uibButtonConfig", "ProcedureOrderService",
            "param", "$uibModal", "ImageService",
            "StaticProperty",
            function ($scope,
                orderResultService,
                $stateParams,
                $uibModalInstance,
                buttonConfig,
                procedureOrderService,
                param,
                $uibModal,
                imageservice,
                staticProperty) {
                var vm = this;
                buttonConfig.activeClass = "greybg";
                vm.datepickerOption = staticProperty.getDateRangeOption(moment(), param.orderDate);
                orderResultService.loadCodeTables(vm);
                vm.getLabRadCodeData = function (term) {
                    return procedureOrderService
                        .getLabRadCode(term)
                        .then(function (result) {
                            return result.data;
                        });
                }

                function initialize() {
                    $scope.ParentLoincCodeId = "";
                    $scope.LoincCodeId = "";
                    return {
                        isNew: true,
                        resultDate: moment(),
                        resultById: abp.session.userId,
                        parentLoincCodeId: "",
                        loincCodeId: "",
                        resultDataCodeId: 2,
                        resultData: "",
                        administrationSiteId: "",
                        unitCodeId: 1,
                        rangeValue: "",
                        abnormalCodeId: 2,
                        note: "",
                        resultStatusCodeId: 1,
                        pid: $stateParams.id,
                        orderId: param.orderId,
                        orderDate: param.orderDate
                    };
                }

                vm.parentLoincCode = [];
                vm.loincCodeSelect = function (item, model, label) {
                    angular.copy([], vm.parentLoincCode);
                    abp.ui.setBusy("#parenttestCode",
                        procedureOrderService
                        .getParentTestCodes(model.loincCodeId)
                        .success(function (result) {
                            for (var i = 0; i < result.length; i++) {
                                vm.parentLoincCode.push(result[i]);
                            }
                        }));
                };
                vm.orderResult = initialize();
                vm.saveOrderResult = function (option) {
                    abp.ui.setBusy();
                    if ($scope.LoincCodeId.loincCodeId) {
                        vm.orderResult.loincCodeId = $scope.LoincCodeId.loincCodeId;
                    }

                    orderResultService.createOrderResult(vm.orderResult, vm)
                        .success(function (result) {
                            abp.notify.info(App.localize("SavedSuccessfully"));
                            if (option === "addmore") {
                                vm.orderResult = initialize();
                            } else {
                                orderResultService.reloadOrderResultByOrderId(param.orderId, $stateParams.id);
                            }
                            orderResultService.setupAnduploadDocuments(vm, result, $stateParams.id);
                        })
                        .finally(function () {
                            abp.ui.clearBusy();
                        });
                }
                vm.close = function () {
                    $uibModalInstance.dismiss();
                };
                vm.openAddLoincCodeModal = function (loinccode) {
                    var modalInstance = $uibModal.open({
                        templateUrl: "/App/Main/views/patient/view/orderentry/addloinccode.cshtml",
                        controller: "app.views.patient.addloincCode as vm",
                        size: "sm",
                        resolve: {
                            param: function () {
                                return {
                                    'loinccode': loinccode
                                };
                            }
                        }
                    })
                        .result.then(function (result) {
                            $scope.LoincCodeId = result;
                        });
                };
                vm.uploadDocs = [];
                $scope.$watch(function (scope) {
                    return scope.vm.uploadDocs.map(function (obj) {
                        return obj.uploadComplete;
                    });
                },
                    function () {
                        if (vm.uploadDocs.length === 0) {
                            $uibModalInstance.close();
                            abp.notify.info(App.localize("UploadedSuccessfully"));
                        }
                        else {
                            imageservice.uploadCompleteUploadDocs(vm.uploadDocs);
                        }
                    },
                    true);
                orderResultService.setupUploadDocs(vm);
            }
        ]);
    angular.module("app")
    .controller("app.views.patient.laborderResult",
    [
        "$scope", "OrderResultService", "$stateParams", "$uibModal", "StaticProperty",
        function ($scope, orderResultService, $stateParams, $uibModal, staticProperty) {
            var vm = this;
            vm.radFilterIn = false;
            vm.itemsByPage = 3;
            vm.searchQuery = "";
            vm.orderResultData = orderResultService
                .getOrderResultDataByPid($stateParams.id, vm.radFilterIn);
            vm.openPanelDetailModal = function (orderId) {
                orderResultService.openPanelDetailModal(orderId, $uibModal, vm.orderResultData);
            }
            vm.openOrderDetailModal = function () {
                orderResultService.openOrderDetailModal($uibModal,
                vm.orderResultData);
            }
        }
    ]);

    angular.module("app")
.controller("app.views.patient.radorderResult",
[
    "$scope", "OrderResultService", "$stateParams", "$uibModal", "StaticProperty",
    function ($scope, orderResultService, $stateParams, $uibModal, staticProperty) {
        var vm = this;
        vm.radFilterIn = true;
        vm.itemsByPage = 3;
        vm.searchQuery = "";
        vm.orderResultData = orderResultService
            .getOrderResultDataByPid($stateParams.id, vm.radFilterIn);
        vm.openPanelDetailModal = function (orderId) {
            orderResultService.openPanelDetailModal(orderId, $uibModal, vm.orderResultData);
        }
        vm.openOrderDetailModal = function () {
            orderResultService.openOrderDetailModal($uibModal, vm.orderResultData);
        }
    }
]);
    angular.module("app").controller("app.views.patient.order.paneldetails", [
        "$scope", "$uibModalInstance", "param", "OrderResultService", "$uibModal",
    function ($scope, $uibModalInstance, param, orderResultService, $uibModal) {
        var vm = this;
        vm.itemsByPage = 8;
        vm.searchQuery = "";
        vm.panelDetails = true;
        var data = _.find(param.orderResultData, function (item) {
            return item.orderId === param.orderId;
        });
        vm.panelData = data.orderResult;
        vm.longCommonName = data.longCommonName;
        vm.viewImageModal = function (id) {
            orderResultService.viewDocImageModal(id, $uibModal);
        }
        vm.close = function () {
            $uibModalInstance.dismiss();
        };
    }
    ]);

    angular.module("app").controller("app.views.patient.order.orderresultdetails", [
    "$scope", "$uibModalInstance", "param", "OrderResultService", "$uibModal",
    function ($scope, $uibModalInstance, param, orderResultService, $uibModal) {
        var vm = this;
        vm.itemsByPage = 8;
        vm.searchQuery = "";
        vm.panelDetails = false;
        vm.data =
            _.filter(param.orderResultData, function (item) {
                return item.isPanel === false;
            })
        vm.panelData = _(vm.data).chain().
        pluck('orderResult').
        flatten().
        value();
        vm.viewImageModal = function (id) {
            orderResultService.viewDocImageModal(id, $uibModal);
        }
        vm.close = function () {
            $uibModalInstance.dismiss();
        };
    }
    ]);

})();
