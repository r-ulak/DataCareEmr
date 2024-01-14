(function () {
    angular.module("app").factory("ICDCodeCNService",
        ["abp.services.app.iCDCodeCN", function (iCDCodeCNService) {
            var factory = {
                createICDCodeCN: function (iCDCodeCN) {
                    return iCDCodeCNService.createICDCodeCN(iCDCodeCN);
                }
            }
            return factory;
        }]);
    angular.module("app").controller("app.views.patient.addiCDCodeCN", [
          "$scope", "ICDCodeCNService", "$stateParams", "$uibModalInstance", "uibButtonConfig", "param",
      function ($scope, iCDCodeCNService, $stateParams, $uibModalInstance,
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
                  iCDCodeCNId: param.icdcode,
                  iCDCodeCNShortName: "",
                  iCDCodeCNName: ""
              };
          }
          vm.iCDCodeCN = initialize();
          vm.saveICDCodeCN = function (option) {
              if (!validateForm()) return;
              abp.ui.setBusy();
              vm.iCDCodeCN.iCDCodeCNId = 'CU' + vm.iCDCodeCN.iCDCodeCNId;
              iCDCodeCNService.createICDCodeCN(vm.iCDCodeCN)
                  .success(function () {
                      abp.notify.info(App.localize("SavedSuccessfully"));
                      if (option === "addmore") {
                          vm.iCDCodeCN = initialize();
                      }
                      else {
                          $uibModalInstance.close(vm.iCDCodeCN.iCDCodeCNId);
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
