(function () {
    angular.module("app").controller("app.views.patientdata.patientedit", [
      "$scope", "$uibModal", "PatientDataService", "$stateParams", "SmartWizardService",
      function ($scope, $uibModal, patientdataService, $stateParams, smartWizardService) {
          var vm = this;
          patientdataService.getPatientData($stateParams.id);
          vm.patientdata = patientdataService.getDemographicsData();
          $scope.leaveAStepCallback = function (objs, context) {
              return smartWizardService.validateSteps(context.fromStep, "wizard_editpatient");
          };
          vm.dateRangeOption = {
              singleDatePicker: true,
              showDropdowns: true,
              minDate: moment("19000101", "YYYYMMDD")
          };
          $scope.save = function (objs, context) {
              if (smartWizardService.validateAllSteps("wizard_editpatient")) {
                  patientdataService
                      .updatePatient(vm.patientdata);

              }
          };
      }
    ]);
})();


