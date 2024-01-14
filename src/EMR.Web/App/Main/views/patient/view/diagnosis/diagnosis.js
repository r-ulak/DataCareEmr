(function () {
    angular.module("app").factory("DiagnosisService",
        ["abp.services.app.diagnosis", function (diagnosisService) {
            var diagnosisList = [];
            var factory = {
                getDiagnosis: function (pid) {
                    diagnosisService.getDiagnosisDetailByPid({
                        patientId: pid
                    }).success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            diagnosisList.push(result[i]);
                        }
                    });
                },
                getDiagnosisByVisitId: function (pid, visitId) {
                    return diagnosisService.getDiagnosisDetailByVisitIdAndPid({
                        patientId: pid,
                        visitId: visitId
                    });
                },
                getCNCode: function (term) {
                    return diagnosisService.getCNCode({
                        term: term
                    });
                },
                createDiagnosis: function (diagnosis) {
                    return diagnosisService.createDiagnosis(diagnosis);
                },
                updateDiagnosis: function (diagnosis) {
                    return diagnosisService.updateDiagnosis(diagnosis);
                },

                getDiagnosisData: function (id) {
                    if (diagnosisList.length === 0)
                        factory.getDiagnosis(id);
                    return diagnosisList;
                },
                clearDiagnosisData: function () {
                    angular.copy([], diagnosisList);
                }
            }
            return factory;
        }]);

    angular.module("app").controller("app.views.patient.diagnosis", [
        "$scope", "DiagnosisService", "$stateParams", "$uibModal",
        function ($scope, diagnosisService, $stateParams, $uibModal) {
            var vm = this;

            diagnosisService.clearDiagnosisData();
            vm.diagnosisData = diagnosisService.getDiagnosisData($stateParams.id);
            vm.itemsByPage = 3;
            vm.searchQuery = "";

            vm.openDiagnosisDetailModal = function () {
                var modalInstance = $uibModal.open({
                    templateUrl: "/App/Main/views/patient/view/diagnosis/diagnosisdetail.cshtml",
                    controller: "app.views.patient.diagnosisdetail as vm",
                    size: "lg"
                });
            };
            vm.openAddDiagnosisModal = function () {
                var modalInstance = $uibModal.open({
                    templateUrl: "/App/Main/views/patient/view/diagnosis/adddiagnosis.cshtml",
                    controller: "app.views.patient.adddiagnosis as vm",
                    size: "md"
                });
            };
        }
    ]);
    angular.module("app").controller("app.views.patient.adddiagnosis", [
          "$scope", "DiagnosisService", "$stateParams", "$uibModalInstance",
          "uibButtonConfig", "UserService", "TenantService", "StatusCodeService",
           "PatientDataService", "$uibModal",
      function ($scope, diagnosisService, $stateParams, $uibModalInstance,
           buttonConfig, userService, tenantService, statusCodeService,
            patientDataService, $uibModal
          ) {
          var vm = this;
          buttonConfig.activeClass = "greybg";

          vm.validationError = [];
          function validateForm() {
              vm.validationError = [];
              if (vm.validationError.length > 0) return false;
              return true;
          }
          vm.datepickerOption = {
              "showDropdowns": true,
              calender_style: "picker_3",
              "maxDate": moment(),
              "minDate": patientDataService.getDemographicsData().dob,
              "singleDatePicker": true, "timePicker": true,
          };
          vm.getCNCodeData = function (term) {
              return diagnosisService
                  .getCNCode(term).then(function (result) {
                      return result.data;
                  });
          }
          vm.administeredByIdCodeData = userService.getAllUsersWithRoleData();
          vm.administrationSiteData = tenantService.getAdministrationSiteData();
          vm.statusCodeIdCodeData = statusCodeService.getStatusCodeData();
          function initialize() {
              $scope.ICDCodeCNId = "";
              return {
                  iCDCodeCNId: "",
                  diagnosisDate: moment(),
                  administeredById: "",
                  administrationSiteId: "",
                  note: "",
                  statusCodeId: "",
                  createDate: "",
                  updateDate: "",
                  pid: $stateParams.id,
                  visitId: $stateParams.visitId
              };
          }
          vm.diagnosis = initialize();
          vm.saveDiagnosis = function (option) {
              if (!validateForm()) return;
              abp.ui.setBusy();
              if ($scope.ICDCodeCNId.icdCodeCNId) {
                  vm.diagnosis.iCDCodeCNId = $scope.ICDCodeCNId.icdCodeCNId;
              } else {
                  vm.diagnosis.iCDCodeCNId = $scope.ICDCodeCNId;
              }
              diagnosisService.createDiagnosis(vm.diagnosis)
                  .success(function () {
                      abp.notify.info(App.localize("SavedSuccessfully"));
                      if (option === "addmore") {
                          vm.diagnosis = initialize();
                      }
                      else {
                          $uibModalInstance.close();
                          diagnosisService.clearDiagnosisData();
                          diagnosisService.getDiagnosis($stateParams.id);
                      }
                  }).finally(function () {
                      abp.ui.clearBusy();
                  });
          }
          vm.close = function () {
              $uibModalInstance.dismiss();
          };
          vm.openAddICDCodeCNModal = function (icdcode) {
              var modalInstance = $uibModal.open({
                  templateUrl: "/App/Main/views/patient/view/diagnosis/addicdcodecn.cshtml",
                  controller: "app.views.patient.addiCDCodeCN as vm",
                  size: "sm",
                  resolve: {
                      param: function () {
                          return {
                              'icdcode': icdcode
                          };
                      }
                  }
              }).result.then(function (result) {
                  $scope.ICDCodeCNId = result;
              });
          };
      }
    ]);

    angular.module("app").controller("app.views.patient.diagnosisdetail", [
        "$scope", "DiagnosisService", "$stateParams", "$uibModalInstance", "StatusCodeService",
    function ($scope, diagnosisService, $stateParams, $uibModalInstance, statusCodeService) {
        var vm = this;

        if (diagnosisService.getDiagnosisData().length === 0) {
            diagnosisService.getDiagnosis($stateParams.id);
        }
        vm.statusCodeData = statusCodeService.getStatusCodeData();
        vm.diagnosisData = diagnosisService.getDiagnosisData();
        vm.itemsByPage = 8;
        vm.searchQuery = "";
        vm.update = function (diagnosis) {
            abp.ui.setBusy();
            diagnosisService.updateDiagnosis(diagnosis)
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
    angular.module("app").controller("app.views.patient.diagnosisvisitdetail", [
"$scope", "DiagnosisService", "$stateParams", "StatusCodeService",
function ($scope, diagnosisService, $stateParams, statusCodeService) {
    var vm = this;
    vm.readonlyview = true;
    vm.processed = false;
    vm.statusCodeData = statusCodeService.getStatusCodeData();
    vm.diagnosisData = [];
    vm.getDiagnosisDetailByPidAndVisitId = function (visitId) {
        if (!vm.processed) {
            diagnosisService.getDiagnosisByVisitId($stateParams.id, visitId)
                .success(function (result) {
                    for (var i = 0; i < result.length; i++) {
                        vm.diagnosisData.push(result[i]);
                    }
                    vm.processed = true;
                });
        }
    }
}
    ]);
})();
