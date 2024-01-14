(function () {
    angular.module("app").factory("SmartWizardService",
      [function () {
          var factory = {
              setError: function (ele, stepnumber) {
                  $("#" + ele).smartWizard("setError", { stepnum: stepnumber, iserror: true });
              },
              validateSteps: function (stepnumber, ele) {
                  return validator.checkAll($("#" + ele + " form").get(stepnumber - 1));
              },
              validateAllSteps: function (ele) {
                  // all step validation logic  
                  for (var i = 1; i <= $("#" + ele + " form").length; i++) {
                      if (!factory.validateSteps(i, ele)) {
                          factory.setError(ele, i);
                          return false;
                      }
                  }
                  return true;
              }
          };
          return factory;
      }]);
})();