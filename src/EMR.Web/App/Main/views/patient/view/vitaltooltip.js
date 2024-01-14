(function () {
    angular.module('app').controller('app.views.patientVital.vitaltooltip', [
        '$scope', '$uibModal', 'abp.services.app.patientVital', 'VitalToolTipService',
    function ($scope, $uibModal, patientVitalService, vitalToolTipService) {
        var vm = this;
        vm.vital = vitalToolTipService.vital;
    }
    ]);
})();


