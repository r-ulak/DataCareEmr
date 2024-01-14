(function () {
    angular.module("app").factory("FamilyHistoryService",
        ["abp.services.app.familyHistory", function (familyHistoryService) {
            var familyHistoryList = [];
            var relationshipCodeList = [];
            var factory = {
                getFamilyHistory: function (pid) {
                    familyHistoryService.getFamilyHistoryDetailByPid({
                        patientId: pid
                    }).success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            familyHistoryList.push(result[i]);
                        }
                    });
                },
                createFamilyHistory: function (familyHistory) {
                    return familyHistoryService.createFamilyHistory(familyHistory);
                },
                updateFamilyHistory: function (familyHistory) {
                    return familyHistoryService.updateFamilyHistory(familyHistory);
                },

                getFamilyHistoryData: function (id) {
                    if (familyHistoryList.length === 0)
                        factory.getFamilyHistory(id);
                    return familyHistoryList;
                },
                clearFamilyHistoryData: function () {
                    angular.copy([], familyHistoryList);
                },
                getRelationshipCode: function () {
                    familyHistoryService.getRelationshipCode().success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            relationshipCodeList.push(result[i]);
                        }
                    });
                },
                getRelationshipCodeData: function () {
                    if (relationshipCodeList.length === 0)
                        factory.getRelationshipCode();
                    return relationshipCodeList;
                },
                clearRelationshipCodeData: function () {
                    angular.copy([], relationshipCodeList);
                }
            }
            return factory;
        }]);

    angular.module("app").controller("app.views.patient.familyHistory", [
        "$scope", "FamilyHistoryService", "$stateParams", "$uibModal",
        function ($scope, familyHistoryService, $stateParams, $uibModal) {
            var vm = this;

            familyHistoryService.clearFamilyHistoryData();
            vm.familyHistoryData = familyHistoryService.getFamilyHistoryData($stateParams.id);
            vm.itemsByPage = 3;
            vm.searchQuery = "";

            vm.openFamilyHistoryDetailModal = function () {
                var modalInstance = $uibModal.open({
                    templateUrl: "/App/Main/views/patient/view/familyHistory/familyHistorydetail.cshtml",
                    controller: "app.views.patient.familyHistorydetail as vm",
                    size: "lg"
                });
            };
            vm.openAddFamilyHistoryModal = function () {
                var modalInstance = $uibModal.open({
                    templateUrl: "/App/Main/views/patient/view/familyHistory/addfamilyHistory.cshtml",
                    controller: "app.views.patient.addfamilyHistory as vm",
                    size: "md"
                });
            };
        }
    ]);
    angular.module("app").controller("app.views.patient.addfamilyHistory", [
          "$scope", "FamilyHistoryService", "$stateParams", "$uibModalInstance",
          "uibButtonConfig", "UserService", "StatusCodeService",
           "PatientDataService", "$uibModal","DiagnosisService",
      function ($scope, familyHistoryService, $stateParams, $uibModalInstance,
           buttonConfig, userService, statusCodeService,
            patientDataService, $uibModal, diagnosisService
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
              "singleDatePicker": true,"timePicker": true,
          };
          vm.getCNCodeData = function (term) {
              return diagnosisService
                  .getCNCode(term).then(function (result) {
                      return result.data;
                  });
          }
          vm.relationshipCodeData = familyHistoryService.getRelationshipCodeData();
          vm.statusCodeIdCodeData = statusCodeService.getStatusCodeData();
          function initialize() {
              $scope.ICDCodeCNId = "";
              return {
                  iCDCodeCNId: "",
                  relationshipCodeId: "",
                  note: "",
                  statusCodeId: "",
                  createDate: "",
                  updateDate: "",
                  pid: $stateParams.id,
                  visitId: $stateParams.visitId
          };
          }
          vm.familyHistory = initialize();
          vm.saveFamilyHistory = function (option) {
              if (!validateForm()) return;
              abp.ui.setBusy();
              if ($scope.ICDCodeCNId.icdCodeCNId) {
                  vm.familyHistory.iCDCodeCNId = $scope.ICDCodeCNId.icdCodeCNId;
              } else {
                  vm.familyHistory.iCDCodeCNId = $scope.ICDCodeCNId;
              }
              familyHistoryService.createFamilyHistory(vm.familyHistory)
                  .success(function () {
                      abp.notify.info(App.localize("SavedSuccessfully"));
                      if (option === "addmore") {
                          vm.familyHistory = initialize();
                      }
                      else {
                          $uibModalInstance.close();
                          familyHistoryService.clearFamilyHistoryData();
                          familyHistoryService.getFamilyHistory($stateParams.id);
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
              });
          };
      }
    ]);

    angular.module("app").controller("app.views.patient.familyHistorydetail", [
        "$scope", "FamilyHistoryService", "$stateParams", "$uibModalInstance", "StatusCodeService",
    function ($scope, familyHistoryService, $stateParams, $uibModalInstance, statusCodeService) {
        var vm = this;

        if (familyHistoryService.getFamilyHistoryData().length === 0) {
            familyHistoryService.getFamilyHistory($stateParams.id);
        }
        vm.statusCodeData = statusCodeService.getStatusCodeData();
        vm.familyHistoryData = familyHistoryService.getFamilyHistoryData();
        vm.itemsByPage = 8;
        vm.searchQuery = "";
        vm.update = function (familyHistory) {
            abp.ui.setBusy();
            familyHistoryService.updateFamilyHistory(familyHistory)
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
})();
