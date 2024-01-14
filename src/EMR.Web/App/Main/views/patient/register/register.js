(function () {
    angular.module('app')
        .controller('app.views.patient.register', [
        '$scope', '$uibModal', 'PatientDataService', 'SmartWizardService',
        function ($scope, $uibModal, patientdataService,  smartWizardService) {
            var vm = this;
            vm.patientdata = patientdataService.getPatientDataInstance();
            vm.dateRangeOption = {
                singleDatePicker: true,
                showDropdowns: true,
                minDate: moment("19000101", "YYYYMMDD")
            };
            $scope.save = function (objs, context) {
                if (smartWizardService.validateAllSteps("wizard_horizontal")) {
                    patientdataService.createPatient(vm.patientdata)
                }
            };
            $scope.leaveAStepCallback = function (objs, context) {
                return smartWizardService.validateSteps(context.fromStep, "wizard_horizontal");
            };
        }
        ]);
})();
