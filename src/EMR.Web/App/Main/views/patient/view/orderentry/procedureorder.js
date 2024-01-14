
(function () {
    angular.module("app").factory("ProcedureOrderService",
        ["abp.services.app.procedureOrder", function (procedureOrderService) {
            var procedureOrderList = [];
            var factory = {
                getProcedureOrder: function (pid) {
                    procedureOrderService.getProcedureOrderDetailByPid({
                        patientId: pid
                    }).success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            procedureOrderList.push(result[i]);
                        }
                    });
                },
                getLabRadCode: function (term) {
                    return procedureOrderService.getLabRadCode({
                        term: term
                    });
                },
                getParentTestCodes: function (codeId) {
                    return procedureOrderService.getParentTestCodes({
                        loincCodeId: codeId
                    });
                },
                createLoincCode: function (loincCode) {
                    return procedureOrderService.createLoincCode(loincCode);
                },
                createProcedureOrder: function (procedureOrder) {
                    return procedureOrderService.createProcedureOrder(procedureOrder);
                },
                updateProcedureOrder: function (procedureOrder) {
                    return procedureOrderService.updateProcedureOrder(procedureOrder);
                },
                getProcedureOrderData: function (id) {
                    if (procedureOrderList.length === 0)
                        factory.getProcedureOrder(id);
                    return procedureOrderList;
                },
                clearProcedureOrderData: function () {
                    angular.copy([], procedureOrderList);
                },
                getProcedureOrderByVisitId: function (pid, visitId) {
                    return procedureOrderService.getProcedureOrderDetailByVisitIdAndPid({
                        patientId: pid,
                        visitId: visitId
                    });
                }
            }
            return factory;
        }]);

    angular.module("app").controller("app.views.patient.procedureOrder", [
        "$scope", "ProcedureOrderService", "$stateParams", "$uibModal",
        function ($scope, procedureOrderService, $stateParams, $uibModal) {
            var vm = this;

            procedureOrderService.clearProcedureOrderData();
            vm.procedureOrderData = procedureOrderService.getProcedureOrderData($stateParams.id);
            vm.itemsByPage = 3;
            vm.searchQuery = "";

            vm.openProcedureOrderDetailModal = function () {
                var modalInstance = $uibModal.open({
                    templateUrl: "/App/Main/views/patient/view/orderentry/procedureOrderdetail.cshtml",
                    controller: "app.views.patient.procedureOrderdetail as vm",
                    size: "lg"
                });
            };
            vm.openAddProcedureOrderModal = function () {
                var modalInstance = $uibModal.open({
                    templateUrl: "/App/Main/views/patient/view/orderentry/addprocedureOrder.cshtml",
                    controller: "app.views.patient.addprocedureOrder as vm",
                    size: "md"
                });
            };
        }
    ]);
    angular.module("app").controller("app.views.patient.addprocedureOrder", [
          "$scope", "ProcedureOrderService", "$stateParams", "$uibModalInstance", "uibButtonConfig", "ProcedureOrderCodeService", "UserService", "$uibModal",
      function ($scope, procedureOrderService, $stateParams, $uibModalInstance,
           buttonConfig, procedureOrderCodeService, userService, $uibModal) {
          var vm = this;
          buttonConfig.activeClass = "greybg";
          vm.getLabRadCodeData = function (term) {
              return procedureOrderService
                  .getLabRadCode(term).then(function (result) {
                      return result.data;
                  });
          }
          vm.validationError = [];
          function validateForm() {
              vm.validationError = [];
              if (vm.validationError.length > 0) return false;
              return true;
          }
          vm.administeredByIdCodeData = userService.getAllUsersWithRoleData();
          vm.priorityCodeData = procedureOrderCodeService.getPriorityCodeData();

          function initialize() {
              $scope.LoincCodeId = "";
              return {
                  priorityCodeId: 1,
                  orderdById: abp.session.userId,
                  loincCodeId: "",
                  note: "",
                  pid: $stateParams.id,
                  visitId: $stateParams.visitId
          };
          }
          vm.procedureOrder = initialize();
          vm.saveProcedureOrder = function (option) {
              if (!validateForm()) return;
              abp.ui.setBusy();
              if ($scope.LoincCodeId.loincCodeId) {
                  vm.procedureOrder.loincCodeId = $scope.LoincCodeId.loincCodeId;
              }
              procedureOrderService.createProcedureOrder(vm.procedureOrder)
                  .success(function () {
                      abp.notify.info(App.localize("SavedSuccessfully"));
                      if (option === "addmore") {
                          vm.procedureOrder = initialize();
                      }
                      else {
                          $uibModalInstance.close();
                          procedureOrderService.clearProcedureOrderData();
                          procedureOrderService.getProcedureOrder($stateParams.id);
                      }
                  }).finally(function () {
                      abp.ui.clearBusy();
                  });
          }
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
              }).result.then(function (result) {
                  $scope.LoincCodeId = result;
              });
          };

          vm.close = function () {
              $uibModalInstance.dismiss();
          };
      }
    ]);

    angular.module("app").controller("app.views.patient.procedureOrderdetail", [
        "$scope", "ProcedureOrderService", "$stateParams", "$uibModalInstance",
        "StatusCodeService", "$uibModal",
    function ($scope, procedureOrderService, $stateParams, $uibModalInstance,
        statusCodeService, $uibModal) {
        var vm = this;
        vm.statusCodeData = statusCodeService.getStatusCodeData();
        vm.canCreateLabResult = abp.auth.isGranted("Pages.PatientView.LabOrderResult.Write");
        vm.canCreateRadResult = abp.auth.isGranted("Pages.PatientView.RadOrderResult.Write");

        vm.procedureOrderData = procedureOrderService.getProcedureOrderData();
        vm.itemsByPage = 8;
        vm.searchQuery = "";
        vm.openModalAddTestResult = function (procedureOrder) {
            var modalInstance = $uibModal.open({
                templateUrl: "/App/Main/views/patient/view/orderentry/addeditorderresult.cshtml",
                controller: "app.views.paitent.addorderResult as vm",
                size: "xmd",
                resolve: {
                    param: function () {
                        return {
                            'orderId': procedureOrder.id,
                            'orderDate': procedureOrder.orderDate,
                        };
                    }
                }
            });
        };
        vm.openModalCollectSpecimen = function (procedureOrder) {
            var modalInstance = $uibModal.open({
                templateUrl: "/App/Main/views/patient/view/orderentry/addeditorderspecimen.cshtml",
                controller: "app.views.paitent.addorderSpecimen as vm",
                size: "xmd",
                resolve: {
                    param: function () {
                        return {
                            'orderId': procedureOrder.id,
                            'orderDate': procedureOrder.orderDate,
                        };
                    }
                }
            });
        };
        vm.update = function (procedureOrder) {
            abp.ui.setBusy();
            procedureOrderService.updateProcedureOrder(procedureOrder)
                  .success(function () {
                      abp.notify.info(App.localize("SavedSuccessfully"));
                  }).finally(function () {
                      abp.ui.clearBusy();
                  });
        }
        vm.close = function () {
            $uibModalInstance.dismiss();
        };
    }
    ]);

    angular.module("app").controller("app.views.patient.addloincCode", [
      "$scope", "ProcedureOrderService", "$stateParams", "$uibModalInstance", "uibButtonConfig", "param",
  function ($scope, procedureOrderService, $stateParams, $uibModalInstance,
       buttonConfig, param) {
      var vm = this;
      buttonConfig.activeClass = "greybg";
      if (!(param.loinccode)) {
          param.loinccode = "";
      }
      vm.validationError = [];
      function validateForm() {
          vm.validationError = [];
          if (vm.validationError.length > 0) return false;
          return true;
      }
      function initialize() {
          return {
              loincCodeId: param.loinccode,
              loincCodeShortName: "",
              loincCodeName: ""
          };
      }
      vm.loincCode = initialize();
      vm.saveLoincCode = function (option) {
          if (!validateForm()) return;
          abp.ui.setBusy();
          vm.loincCode.loincCodeId = "CU" + vm.loincCode.loincCodeId;
          procedureOrderService.createLoincCode(vm.loincCode)
              .success(function () {
                  abp.notify.info(App.localize("SavedSuccessfully"));
                  if (option === "addmore") {
                      vm.loincCode = initialize();
                  }
                  else {
                      $uibModalInstance.close(vm.loincCode.loincCodeId);
                  }
              }).finally(function () {
                  abp.ui.clearBusy();
              });
      }
      vm.close = function () {
          $uibModalInstance.dismiss();
      };
  }
    ]);

    angular.module("app").controller("app.views.patient.procedureordervisitdetail", [
"$scope", "ProcedureOrderService", "$stateParams", "StatusCodeService",
function ($scope, procedureorderService, $stateParams, statusCodeService) {
    var vm = this;
    vm.readonlyview = true;
    vm.statusCodeData = statusCodeService.getStatusCodeData();
    vm.procedureOrderData = [];
    vm.processed = false;
    vm.getProcedureorderDetailByPidAndVisitId = function (visitId) {
        if (!vm.processed) {
            procedureorderService.getProcedureOrderByVisitId($stateParams.id, visitId).success(function (result) {
                for (var i = 0; i < result.length; i++) {
                    vm.procedureOrderData.push(result[i]);
                }
                vm.processed = true;
            });
        }
    }
}
    ]);
})();
