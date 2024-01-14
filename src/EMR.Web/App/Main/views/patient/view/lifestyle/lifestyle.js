(function () {
    angular.module("app").factory("LifeStyleService",
        ["abp.services.app.lifeStyle", function (lifeStyleService) {
            var lifeStyleList = [];
            var lifeStyleCodeList = [];
            var factory = {
                getLifeStyle: function (pid) {
                    lifeStyleService.getLifeStyleDetailByPid({
                        patientId: pid
                    }).success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            lifeStyleList.push(result[i]);
                        }
                    });
                },
                getLifeStyleCode: function () {
                    lifeStyleService.getLifeStyleCode({
                    }).success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            lifeStyleCodeList.push(result[i]);
                        }
                    });
                },
                createLifeStyle: function (lifeStyle) {
                    return lifeStyleService.createLifeStyle(lifeStyle);
                },
                updateLifeStyle: function (lifeStyle) {
                    return lifeStyleService.updateLifeStyle(lifeStyle);
                },
                getLifeStyleCodeData: function () {
                    if (lifeStyleCodeList.length === 0)
                        factory.getLifeStyleCode();
                    return lifeStyleCodeList;
                },
                getLifeStyleData: function (id) {
                    if (lifeStyleList.length === 0)
                        factory.getLifeStyle(id);
                    return lifeStyleList;
                },
                clearLifeStyleData: function () {
                    angular.copy([], lifeStyleList);
                },
                getLifeStyleByVisitId: function (pid, visitId) {
                    return lifeStyleService.getLifeStyleDetailByVisitIdAndPid({
                        patientId: pid,
                        visitId: visitId
                    });
                }
            }
            return factory;
        }]);

    angular.module("app").controller("app.views.patient.lifeStyle", [
        "$scope", "LifeStyleService", "$stateParams", "$uibModal",
        function ($scope, lifeStyleService, $stateParams, $uibModal) {
            var vm = this;

            lifeStyleService.clearLifeStyleData();
            vm.lifeStyleData = lifeStyleService.getLifeStyleData($stateParams.id);
            vm.itemsByPage = 3;
            vm.searchQuery = "";

            vm.openLifeStyleDetailModal = function () {
                var modalInstance = $uibModal.open({
                    templateUrl: "/App/Main/views/patient/view/lifeStyle/lifeStyledetail.cshtml",
                    controller: "app.views.patient.lifeStyledetail as vm",
                    size: "lg"
                });
            };

            vm.openAddLifeStyleModal = function () {
                var modalInstance = $uibModal.open({
                    templateUrl: "/App/Main/views/patient/view/lifeStyle/addlifeStyle.cshtml",
                    controller: "app.views.patient.addlifeStyle as vm",
                    size: "md"
                });
            };
        }
    ]);
    angular.module("app").controller("app.views.patient.addlifeStyle", [
        "$scope", "LifeStyleService", "$stateParams", "$uibModalInstance", "uibButtonConfig", "LifeStyleService",
    function ($scope, lifeStyleService, $stateParams, $uibModalInstance,
         buttonConfig) {
        var vm = this;
        buttonConfig.activeClass = "greybg";
        vm.lifeStyleData = lifeStyleService.getLifeStyleData();

        vm.validationError = [];
        function validateForm() {
            vm.validationError = [];
            if (_.findWhere(vm.lifeStyleData, { lifeStyleTypeId: vm.lifeStyle.lifeStyleTypeId })) {
                vm.validationError.push("Selected lifestyle type already exists.");
            }
            if (vm.validationError.length > 0) return false;
            return true;
        }
        vm.lifeStyleCodeData = lifeStyleService.getLifeStyleCodeData();
        function initialize() {
            return {
                pid: $stateParams.id,
                visitId: $stateParams.visitId,
                lifeStyleTypeId: "",
                currentlyActive: "",
                note: ""
            };
        }
        vm.lifeStyle = initialize();
        vm.saveLifeStyle = function (option) {
            if (!validateForm()) return;
            abp.ui.setBusy();
            lifeStyleService.createLifeStyle(vm.lifeStyle)
                .success(function () {
                    abp.notify.info(App.localize("SavedSuccessfully"));
                    if (option === "addmore") {
                        vm.lifeStyle = initialize();
                    }
                    else {
                        $uibModalInstance.close();
                        lifeStyleService.clearLifeStyleData();
                        lifeStyleService.getLifeStyle($stateParams.id);
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

    angular.module("app").controller("app.views.patient.lifeStyledetail", [
        "$scope", "LifeStyleService", "$stateParams", "$uibModalInstance", "PatientDataService",
    function ($scope, lifeStyleService, $stateParams, $uibModalInstance, patientDataService) {
        var vm = this;

        if (lifeStyleService.getLifeStyleData().length === 0) {
            lifeStyleService.getLifeStyle($stateParams.id);
        }

        vm.lifeStyleData = lifeStyleService.getLifeStyleData();
        vm.itemsByPage = 8;
        vm.searchQuery = "";
        vm.datepickerOption = {
            "showDropdowns": true,
            calender_style: "picker_3",
            "maxDate": moment(),
            "minDate": patientDataService.getDemographicsData().dob,
            "singleDatePicker": true
        };
        vm.close = function () {
            $uibModalInstance.dismiss();
        };
        vm.update = function (lifeStyle) {
            lifeStyle.dob = patientDataService.getDemographicsData().dob;
            lifeStyle.Pid = $stateParams.id;
            lifeStyleService.updateLifeStyle(lifeStyle)
                .success(function () {
                    abp.notify.info(App.localize("SavedSuccessfully"));
                });
        }
    }
    ]);

    angular.module("app").controller("app.views.patient.lifestylevisitdetail", ["$scope", "LifeStyleService", "$stateParams", "StatusCodeService",
function ($scope, lifeStyleService, $stateParams, statusCodeService) {
    var vm = this;
    vm.readonlyview = true;
    vm.statusCodeData = statusCodeService.getStatusCodeData();
    vm.lifeStyleData = [];
    vm.processed = false;
    vm.getLifeStyleDetailByPidAndVisitId = function (visitId) {
        if (!vm.processed) {
            lifeStyleService.getLifeStyleByVisitId($stateParams.id, visitId).success(function (result) {
                for (var i = 0; i < result.length; i++) {
                    vm.lifeStyleData.push(result[i]);
                }
                vm.processed = true;
            });
        }
    }
}
    ]);
})();
