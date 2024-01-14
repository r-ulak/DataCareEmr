(function () {
    angular.module("app").factory("SurgeryService",
        ["abp.services.app.surgery", function (surgeryService) {
            var surgeryList = [];
            var factory = {
                getSurgery: function (pid) {
                    surgeryService.getSurgeryDetailByPid({
                        patientId: pid
                    }).success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            surgeryList.push(result[i]);
                        }
                    });
                },
                getSurgeryByVisitId: function (pid, visitId) {
                    return surgeryService.getSurgeryDetailByVisitIdAndPid({
                        patientId: pid,
                        visitId: visitId
                    });
                },
                getPCSCode: function (term) {
                    return surgeryService.getPCSCode({
                        term: term
                    });
                },
                createSurgery: function (surgery) {
                    return surgeryService.createSurgery(surgery);
                },
                updateSurgery: function (surgery) {
                    return surgeryService.updateSurgery(surgery);
                },

                getSurgeryData: function (id) {
                    if (surgeryList.length === 0)
                        factory.getSurgery(id);
                    return surgeryList;
                },
                clearSurgeryData: function () {
                    angular.copy([], surgeryList);
                }
            }
            return factory;
        }]);

    angular.module("app").controller("app.views.patient.surgery", [
        "$scope", "SurgeryService", "$stateParams", "$uibModal",
        function ($scope, surgeryService, $stateParams, $uibModal) {
            var vm = this;

            surgeryService.clearSurgeryData();
            vm.surgeryData = surgeryService.getSurgeryData($stateParams.id);
            vm.itemsByPage = 3;
            vm.searchQuery = "";

            vm.openSurgeryDetailModal = function () {
                var modalInstance = $uibModal.open({
                    templateUrl: "/App/Main/views/patient/view/surgery/surgerydetail.cshtml",
                    controller: "app.views.patient.surgerydetail as vm",
                    size: "lg"
                });
            };
            vm.openAddSurgeryModal = function () {
                var modalInstance = $uibModal.open({
                    templateUrl: "/App/Main/views/patient/view/surgery/addsurgery.cshtml",
                    controller: "app.views.patient.addsurgery as vm",
                    size: "md"
                });
            };
        }
    ]);
    angular.module("app").controller("app.views.patient.addsurgery", [
          "$scope", "SurgeryService", "$stateParams", "$uibModalInstance",
          "uibButtonConfig", "UserService", "TenantService", "StatusCodeService",
          "OutcomeCodeService", "PatientDataService", "$uibModal",
      function ($scope, surgeryService, $stateParams, $uibModalInstance,
           buttonConfig, userService, tenantService, statusCodeService,
           outcomeCodeService, patientDataService, $uibModal
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
          vm.getPCSCodeData = function (term) {
              return surgeryService
                  .getPCSCode(term).then(function (result) {
                      return result.data;
                  });
          }
          vm.administeredByIdCodeData = userService.getAllUsersWithRoleData();
          vm.administrationSiteData = tenantService.getAdministrationSiteData();
          vm.statusCodeIdCodeData = statusCodeService.getStatusCodeData();
          vm.outcomeCodeIdCodeData = outcomeCodeService.getOutcomeCodeData();
          function initialize() {
              $scope.ICDCodePCSId = "";
              return {
                  iCDCodePCSId: "",
                  surgeryDate: moment(),
                  administeredById: "",
                  administrationSiteId: "",
                  outcomeCodeId: "",
                  note: "",
                  statusCodeId: "",
                  createDate: "",
                  updateDate: "",
                  pid: $stateParams.id,
                  visitId: $stateParams.visitId
              };
          }
          vm.surgery = initialize();
          vm.saveSurgery = function (option) {
              if (!validateForm()) return;
              abp.ui.setBusy();
              if ($scope.ICDCodePCSId.icdCodePCSId) {
                  vm.surgery.iCDCodePCSId = $scope.ICDCodePCSId.icdCodePCSId;
              } else {
                  vm.surgery.iCDCodePCSId = $scope.ICDCodePCSId;
              }
              surgeryService.createSurgery(vm.surgery)
                  .success(function () {
                      abp.notify.info(App.localize("SavedSuccessfully"));
                      if (option === "addmore") {
                          vm.surgery = initialize();
                      }
                      else {
                          $uibModalInstance.close();
                          surgeryService.clearSurgeryData();
                          surgeryService.getSurgery($stateParams.id);
                      }
                  }).finally(function () {
                      abp.ui.clearBusy();
                  });
          }
          vm.close = function () {
              $uibModalInstance.dismiss();
          };
          vm.openAddICDCodePCSModal = function (icdcode) {
              var modalInstance = $uibModal.open({
                  templateUrl: "/App/Main/views/patient/view/surgery/addicdcodepcs.cshtml",
                  controller: "app.views.patient.addiCDCodePCS as vm",
                  size: "sm",
                  resolve: {
                      param: function () {
                          return {
                              'icdcode': icdcode
                          };
                      }
                  }
              }).result.then(function (result) {
                  $scope.ICDCodePCSId = result;
              });
          };
      }
    ]);

    angular.module("app").controller("app.views.patient.surgerydetail", [
        "$scope", "SurgeryService", "$stateParams", "$uibModalInstance", "StatusCodeService",
    function ($scope, surgeryService, $stateParams, $uibModalInstance, statusCodeService) {
        var vm = this;

        if (surgeryService.getSurgeryData().length === 0) {
            surgeryService.getSurgery($stateParams.id);
        }
        vm.statusCodeData = statusCodeService.getStatusCodeData();
        vm.surgeryData = surgeryService.getSurgeryData();
        vm.itemsByPage = 8;
        vm.searchQuery = "";
        vm.update = function (surgery) {
            abp.ui.setBusy();
            surgeryService.updateSurgery(surgery)
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

    angular.module("app").controller("app.views.patient.surgeryvisitdetail", [
    "$scope", "SurgeryService", "$stateParams", "StatusCodeService",
function ($scope, surgeryService, $stateParams, statusCodeService) {
    var vm = this;
    vm.readonlyview = true;
    vm.statusCodeData = statusCodeService.getStatusCodeData();
    vm.surgeryData = [];
    vm.processed = false;
    vm.getSurgeryDetailByPidAndVisitId = function (visitId) {
        if (!vm.processed) {
            surgeryService.getSurgeryByVisitId($stateParams.id, visitId).success(function (result) {
                for (var i = 0; i < result.length; i++) {
                    vm.surgeryData.push(result[i]);
                }
                vm.processed = true;
            });
        }
    }
}
    ]);
})();
