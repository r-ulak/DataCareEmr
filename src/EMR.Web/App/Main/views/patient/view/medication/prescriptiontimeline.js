(function () {
    angular.module('app').controller('app.views.patientdata.prescriptiontimeline', [
     '$scope', 'PrescriptionService', '$stateParams','$uibModalInstance',
     function ($scope, prescriptionService, $stateParams, $uibModalInstance) {
         var vm = this;
         prescriptionService.clearPrescriptionTimelineData();
         prescriptionService.getPrescriptionTimeline($stateParams.id);
         $scope.prescriptionTimelineData = prescriptionService.getPrescriptionTimelineData();
         vm.itemsByPage = 10;
         vm.close = function () {
             $uibModalInstance.dismiss();
         };
     }
    ]);
})();


