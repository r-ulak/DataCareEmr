(function () {
    angular.module('app').controller('app.views.vital.captureVital', [
        '$scope', '$uibModalInstance', 'abp.services.app.patientVital', 'PatientDataService',
        function ($scope, $uibModalInstance, patientService, patientdataService) {
            var vm = this;
            vm.vital = {
                bps: '11',
                bpd: '22',
                weightCaptured: '11',
                weightUnit: 'kg',
                tempUnit: 'C',
                lenghtUnit: 'cm',
                dateOfBirth: patientdataService.getDemographicsData().dob,
                pulse: '11',
                heightCaptured: '11',
                oxygenSaturation: '11',
                tempratureCaptured: '1111'
            };
            vm.setUnitWeight = function (unit) {
                vm.vital.weightUnit = unit;
            };
            vm.setUnitTemprature = function (unit) {
                vm.vital.tempUnit = unit;
            };
            vm.setUnitLength = function (unit) {
                vm.vital.lenghtUnit = unit;
            };
            vm.save = function () {
                abp.ui.setBusy();
                patientService.captureVitals(vm.vital)
                    .success(function () {
                        abp.notify.info(App.localize('SavedSuccessfully'));
                        $uibModalInstance.close();
                    }).finally(function () {
                        abp.ui.clearBusy();
                    });
            };

            vm.cancel = function () {
                $uibModalInstance.dismiss();
            };
        }
    ]);
})();