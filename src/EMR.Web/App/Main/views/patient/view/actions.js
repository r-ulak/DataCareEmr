(function () {
    angular.module('app').controller('app.views.vital.actions', [
        '$scope', '$uibModal', function ($scope, $uibModal) {
            var vm = this;

            vm.openVitalCaptureModal = function () {
                var modalInstance = $uibModal.open({
                    templateUrl: '/App/Main/views/patient/view/capturevitals.cshtml',
                    controller: 'app.views.vital.captureVital as vm',
                    backdrop: 'static'
                });
            };
        }
    ]);
})();