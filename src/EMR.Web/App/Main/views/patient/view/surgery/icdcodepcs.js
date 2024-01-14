(function () {
    angular.module("app").factory("ICDCodePCSService",
        ["abp.services.app.iCDCodePCS", function (iCDCodePCSService) {
            var factory = {
                createICDCodePCS: function (iCDCodePCS) {
                    return iCDCodePCSService.createICDCodePCS(iCDCodePCS);
                }
            }
            return factory;
        }]);
    angular.module("app").controller("app.views.patient.addiCDCodePCS", [
          "$scope", "ICDCodePCSService", "$stateParams", "$uibModalInstance", "uibButtonConfig", "param",
      function ($scope, iCDCodePCSService, $stateParams, $uibModalInstance,
           buttonConfig, param) {
          var vm = this;
          buttonConfig.activeClass = "greybg";
          if (!(param.icdcode)) {
              param.icdcode = "";
          }
          vm.validationError = [];
          function validateForm() {
              vm.validationError = [];
              if (vm.validationError.length > 0) return false;
              return true;
          }
          function initialize() {
              return {
                  iCDCodePCSId: param.icdcode,
                  iCDCodePCSShortName: "",
                  iCDCodePCSName: ""
              };
          }
          vm.iCDCodePCS = initialize();
          vm.saveICDCodePCS = function (option) {
              if (!validateForm()) return;
              abp.ui.setBusy();
              vm.iCDCodePCS.iCDCodePCSId = 'CU' + vm.iCDCodePCS.iCDCodePCSId;
              iCDCodePCSService.createICDCodePCS(vm.iCDCodePCS)
                  .success(function () {
                      abp.notify.info(App.localize("SavedSuccessfully"));
                      if (option === "addmore") {
                          vm.iCDCodePCS = initialize();
                      }
                      else {
                          $uibModalInstance.close(vm.iCDCodePCS.iCDCodePCSId);
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
})();
