(function() {
    angular.module('app')
        .factory('PrescriptionService',
        [
            'abp.services.app.prescription', function(prescriptionService) {
                var prescriptionDetailList = [];
                var prescriptionTimelineList = [];
                var doseUnitCodeList = [];
                var drugFormCodeList = [];
                var frequencyCodeList = [];
                var therapyCodeList = [];
                var drugRouteCodeList = [];

                var factory = {
                    getDrugRouteCode: function() {
                        prescriptionService.getDrugRouteCode()
                            .success(function(result) {
                                for (var i = 0; i < result.length; i++) {
                                    drugRouteCodeList.push(result[i]);
                                }
                            });
                    },
                    getDrugRouteCodeData: function() {
                        if (drugRouteCodeList.length === 0)
                            factory.getDrugRouteCode();
                        return drugRouteCodeList;
                    },
                    getTherapyCode: function() {
                        prescriptionService.getTherapyCode()
                            .success(function(result) {
                                for (var i = 0; i < result.length; i++) {
                                    therapyCodeList.push(result[i]);
                                }
                            });
                    },
                    getTherapyCodeData: function() {
                        if (therapyCodeList.length === 0)
                            factory.getTherapyCode();
                        return therapyCodeList;
                    },
                    getFrequencyCode: function() {
                        prescriptionService.getFrequencyCode()
                            .success(function(result) {
                                for (var i = 0; i < result.length; i++) {
                                    frequencyCodeList.push(result[i]);
                                }
                            });
                    },
                    getFrequencyCodeData: function() {
                        if (frequencyCodeList.length === 0)
                            factory.getFrequencyCode();
                        return frequencyCodeList;
                    },
                    getDrugFormCode: function() {
                        prescriptionService.getDrugFormCode()
                            .success(function(result) {
                                for (var i = 0; i < result.length; i++) {
                                    drugFormCodeList.push(result[i]);
                                }
                            });
                    },
                    getDrugFormCodeData: function(id) {
                        if (drugFormCodeList.length === 0)
                            factory.getDrugFormCode(id);
                        return drugFormCodeList;
                    },
                    getDoseUnitCode: function() {
                        prescriptionService.getDoseUnitCode()
                            .success(function(result) {
                                for (var i = 0; i < result.length; i++) {
                                    doseUnitCodeList.push(result[i]);
                                }
                            });
                    },
                    getDoseUnitCodeData: function() {
                        if (doseUnitCodeList.length === 0)
                            factory.getDoseUnitCode();
                        return doseUnitCodeList;
                    },
                    getPrescriptionDetail: function(pid) {
                        prescriptionService.getPrescriptionDetail({
                                patientId: pid
                            })
                            .success(function(result) {
                                for (var i = 0; i < result.length; i++) {
                                    prescriptionDetailList.push(result[i]);
                                }
                            });
                    },
                    getPrescriptionTimeline: function(pid) {
                        prescriptionService.getPrescriptionTimeLine({
                                patientId: pid
                            })
                            .success(function(result) {
                                for (var i = 0; i < result.length; i++) {
                                    prescriptionTimelineList.push(result[i]);
                                }
                            });
                    },
                    createPrescription: function(prescription) {
                        return prescriptionService.createPrescription(prescription);
                    },
                    updatePrescription: function(prescription) {
                        return prescriptionService.updatePrescription(prescription);
                    },
                    getPrescriptionDetailData: function(id) {
                        if (prescriptionDetailList.length === 0) {
                            factory.getPrescriptionDetail(id);
                        }
                        return prescriptionDetailList;
                    },
                    getPrescriptionTimelineData: function() {
                        return prescriptionTimelineList;
                    },
                    clearPrescriptionDetailData: function() {
                        angular.copy([], prescriptionDetailList);
                    },
                    clearPrescriptionTimelineData: function() {
                        angular.copy([], prescriptionTimelineList);
                    },
                    getPrescriptionByVisitId: function (pid, visitId) {
                        return prescriptionService.getPrescriptionDetailByVisitIdAndPid({
                            patientId: pid,
                            visitId: visitId
                        });
                    },
                }
                return factory;
            }
        ]);

    angular.module('app')
        .controller('app.views.patientdata.prescription',
        [
            '$scope', 'PrescriptionService', '$stateParams', '$uibModal',
            function($scope, prescriptionService, $stateParams, $uibModal) {
                var vm = this;
                prescriptionService.clearPrescriptionDetailData();
                vm.prescriptionData = prescriptionService.getPrescriptionDetailData($stateParams.id);
                vm.itemsByPage = 3;
                vm.searchQuery = '';

                vm.openPrescriptionModal = function() {
                    var modalInstance = $uibModal.open({
                        templateUrl: '/App/Main/views/patient/view/medication/prescriptiondetail.cshtml',
                        controller: 'app.views.patientdata.prescriptiondetail as vm',
                        size: 'lg',
                    });
                };
                vm.openPrescriptionTimelineModal = function() {
                    var modalInstance = $uibModal.open({
                        templateUrl: '/App/Main/views/patient/view/medication/prescriptiontimeline.cshtml',
                        controller: 'app.views.patientdata.prescriptiontimeline as vm',
                        size: 'lg',
                    });
                };

                vm.openAddPrescriptionModal = function() {
                    var modalInstance = $uibModal.open({
                        templateUrl: '/App/Main/views/patient/view/medication/addprescription.cshtml',
                        controller: 'app.views.patient.addprescription as vm',
                        size: 'md'
                    });
                };
            }
        ]);

    angular.module("app")
        .controller("app.views.patient.addprescription",
        [
            "$scope", "RxNormService", "$stateParams", "$uibModalInstance",
            "uibButtonConfig", "PrescriptionService", "PatientDataService", "UserService", "DiagnosisService",
            function($scope,
                rxNormService,
                $stateParams,
                $uibModalInstance,
                buttonConfig,
                prescriptionService,
                patientDataService,
                userService,
                diagnosisService
            ) {
                var vm = this;
                buttonConfig.activeClass = "greybg";
                vm.datepickerOption = {
                    "showDropdowns": true,
                    calender_style: "picker_3",
                    "minDate": patientDataService.getDemographicsData().dob,
                    "singleDatePicker": true,"timePicker": true,
                };

                vm.validationError = [];
                vm.administeredByIdCodeData = userService.getAllUsersWithRoleData();
                vm.doseUnitCodeData = prescriptionService.getDoseUnitCodeData();
                vm.drugFormCodeData = prescriptionService.getDrugFormCodeData();
                vm.drugRouteCodeData = prescriptionService.getDrugRouteCodeData();
                vm.frequencyCodeData = prescriptionService.getFrequencyCodeData();
                vm.therapyCodeData = prescriptionService.getTherapyCodeData();

                function validateForm() {
                    vm.validationError = [];
                    if (vm.validationError.length > 0) return false;
                    return true;
                }

                vm.getRxNormData = function(term) {
                    return rxNormService.queryRxNormApproximate(term)
                        .then(function(result) {
                            return _.map(result,
                                function(promise) {
                                    return {
                                        name: promise.data.idGroup.name,
                                        rxcui: promise.data.idGroup.rxnormId[0]
                                    }
                                });
                        });
                }
                vm.getCNCodeData = function($query) {
                    return diagnosisService
                        .getCNCode($query);
                }

                function initialize() {
                    $scope.RxNormNameId = "";
                    return {
                        drugId: "",
                        pid: $stateParams.id,
                        visitId: $stateParams.visitId,
                        rxNormName: "",
                        doseUnitCodeId: "",
                        doseSize: "",
                        dosage: "",
                        frequencyCodeId: "",
                        drugRouteCodeId: "",
                        drugFormCodeId: "",
                        quantity: "",
                        refills: "",
                        providerId: abp.session.userId,
                        startDate: moment(),
                        duration: "",
                        refillDate: "",
                        therapyCodeId: "",
                        substitutionAllowed: "",
                        note: "",
                        primaryCondition: "",
                        secondaryCondition: ""
                    };
                }


                vm.prescription = initialize();
                vm.savePrescription = function(option) {
                    if (!validateForm()) return;
                    if ($scope.RxNormNameId.rxcui) {
                        vm.prescription.drugId = $scope.RxNormNameId.rxcui;
                        vm.prescription.rxNormName = $scope.RxNormNameId.name;
                    } else {
                        vm.prescription.rxNormName = $scope.RxNormNameId;
                        vm.prescription.drugId = $scope.RxNormNameId;
                    }
                    vm.prescription.primaryCondition = _.map(vm.prescription.primaryCondition,
                        function(item, key) {
                            return { icdCodeCNId: item.icdCodeCNId };
                        });
                    vm.prescription.secondaryCondition = _.map(vm.prescription.secondaryCondition,
                        function(item, key) {
                            return { icdCodeCNId: item.icdCodeCNId };
                        });

                    abp.ui.setBusy();
                    prescriptionService.createPrescription(vm.prescription)
                        .success(function() {

                            abp.notify.info(App.localize("SavedSuccessfully"));
                            if (option === "addmore") {
                                vm.prescription = initialize();
                            } else {
                                $uibModalInstance.close();
                                prescriptionService.clearPrescriptionDetailData();
                                prescriptionService.getPrescriptionDetailData($stateParams.id);
                            }
                        })
                        .finally(function() {
                            abp.ui.clearBusy();
                        });
                }

                vm.close = function() {
                    $uibModalInstance.dismiss();
                };
            }
        ]);

    angular.module('app')
        .controller('app.views.patientdata.prescriptiondetail',
        [
            '$scope', 'PrescriptionService', '$stateParams', '$uibModalInstance', "StatusCodeService",
            function($scope, prescriptionService, $stateParams, $uibModalInstance, statusCodeService) {
                var vm = this;
                vm.statusCodeData = statusCodeService.getStatusCodeData();
                vm.datepickerOption = {
                    "showDropdowns": true,
                    calender_style: "picker_3",
                    "singleDatePicker": true
                };
                vm.prescriptionData = prescriptionService.getPrescriptionDetailData($stateParams.id);
                vm.itemsByPage = 5;
                vm.searchQuery = '';
                vm.update = function (prescription) {
                    prescription.pid = $stateParams.id;
                    abp.ui.setBusy();
                    prescriptionService.updatePrescription(prescription)
                          .success(function () {
                              abp.notify.info(App.localize("SavedSuccessfully"));
                          }).finally(function () {
                              abp.ui.clearBusy();
                          });

                }
                vm.close = function() {
                    $uibModalInstance.dismiss();
                };
            }
        ]);

    angular.module("app").controller("app.views.patient.prescriptionvisitdetail", [
    "$scope", "PrescriptionService", "$stateParams", "StatusCodeService",
function ($scope, prescriptionService, $stateParams, statusCodeService) {
    var vm = this;
    vm.readonlyview = true;
    vm.statusCodeData = statusCodeService.getStatusCodeData();
    vm.prescriptionData = [];
    vm.processed = false;
    vm.getPrescriptionDetailByPidAndVisitId = function (visitId) {
        if (!vm.processed) {
            prescriptionService.getPrescriptionByVisitId($stateParams.id, visitId).success(function (result) {
                for (var i = 0; i < result.length; i++) {
                    vm.prescriptionData.push(result[i]);
                }
                vm.processed = true;
            });
        }
    }
}
    ]);

})();


