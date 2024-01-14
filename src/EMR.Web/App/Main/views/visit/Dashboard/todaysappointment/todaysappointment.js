(function () {
    angular.module('app').controller('app.views.todaysappointment',
        ['$scope', "AppointmentService", "UserPreferenceService", "$uibModal",
            function ($scope, appointmentService, userPreferenceService, $uibModal) {
                var vm = this;
                var userpref = userPreferenceService.getUserPrefByIdData(abp.session.userId, true);

                vm.todaysAppointment = appointmentService.getAppointmentByDateData({
                    viewDate: moment(),
                    administrationSiteId: userpref.administrationSiteId
                });

                vm.openTodaysAppointmentDetailModal = function () {
                    var modalInstance = $uibModal.open({
                        templateUrl: "/App/Main/views/visit/Dashboard/todaysappointment/todaysappointmentdetail.cshtml",
                        controller: "app.views.todaysappointmentdetail as vm",
                        size: "lg"
                    });
                };
                vm.refresh = function () {
                    appointmentService.clearAppointmentByDateData();
                    appointmentService.getAppointmentByDateData({
                        viewDate: moment(),
                        administrationSiteId: userpref.administrationSiteId
                    });
                };
            }
        ]);
    angular.module("app").controller("app.views.todaysappointmentdetail", [
     "$scope", "AppointmentService", "$uibModalInstance", "UserPreferenceService",
 function ($scope, appointmentService, $uibModalInstance, userPreferenceService) {
     var vm = this;

     var userpref = userPreferenceService.getUserPrefByIdData(abp.session.userId, true);

     vm.todaysAppointment = appointmentService.getAppointmentByDateData({
         viewDate: moment(),
         administrationSiteId: userpref.administrationSiteId
     });
     vm.itemsByPage = 8;
     vm.searchQuery = "";

     vm.close = function () {
         $uibModalInstance.dismiss();
     };
 }
    ]);
})();
