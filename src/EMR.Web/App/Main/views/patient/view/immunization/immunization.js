(function () {
    angular.module("app").factory("ImmunizationService",
        ["abp.services.app.immunizations", function (immunizationService) {
            var immunizationList = [];
            var immunizationCodeList = [];
            var completionStatusCodeList = [];
            var informationSourceCodeList = [];
            var factory = {
                getImmunization: function (pid) {
                    immunizationService.getImmunizationDetailByPid({
                        patientId: pid
                    }).success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            immunizationList.push(result[i]);
                        }
                    });
                },
                getInformationSourceCode: function () {
                    immunizationService.getInformationSource({
                    }).success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            informationSourceCodeList.push(result[i]);
                        }
                    });
                },
                getCompletionStatusCode: function () {
                    immunizationService.getCompletionStatusCode({
                    }).success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            completionStatusCodeList.push(result[i]);
                        }
                    });
                },
                getImmunizationCode: function () {
                    immunizationService.getImmunizationCode({
                    }).success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            immunizationCodeList.push(result[i]);
                        }
                    });
                },
                createImmunization: function (immunization) {
                    return immunizationService.createImmunization(immunization);
                },
                getInformationSourceCodeData: function () {
                    if (informationSourceCodeList.length === 0)
                        factory.getInformationSourceCode();
                    return informationSourceCodeList;
                },
                getCompletionStatusCodeData: function () {
                    if (completionStatusCodeList.length === 0)
                        factory.getCompletionStatusCode();
                    return completionStatusCodeList;
                },
                getImmunizationCodeData: function () {
                    if (immunizationCodeList.length === 0)
                        factory.getImmunizationCode();
                    return immunizationCodeList;
                },
                getImmunizationData: function (id) {
                    if (immunizationList.length === 0)
                        factory.getImmunization(id);
                    return immunizationList;
                },
                clearImmunizationData: function () {
                    angular.copy([], immunizationList);
                }
            }
            return factory;
        }]);

    angular.module("app").controller("app.views.patientdata.immunization", [
        "$scope", "ImmunizationService", "$stateParams", "$uibModal",
        function ($scope, immunizationService, $stateParams, $uibModal) {
            var vm = this;

            immunizationService.clearImmunizationData();
            vm.immunizationData = immunizationService.getImmunizationData($stateParams.id);
            vm.itemsByPage = 3;
            vm.searchQuery = "";

            vm.openImmunizationDetailModal = function () {
                var modalInstance = $uibModal.open({
                    templateUrl: "/App/Main/views/patient/view/immunization/immunizationdetail.cshtml",
                    controller: "app.views.patientdata.immunizationdetail as vm",
                    size: "lg",
                });
            };
            vm.openAddImmunizationModal = function () {
                var modalInstance = $uibModal.open({
                    templateUrl: "/App/Main/views/patient/view/immunization/addimmunization.cshtml",
                    controller: "app.views.patientdata.addimmunization as vm",
                    size: "md",
                });
            };
        }
    ]);
    angular.module("app").controller("app.views.patientdata.addimmunization", [
        "$scope", "ImmunizationService", "$stateParams", "$uibModalInstance", "PatientDataService", "uibButtonConfig", "ImmunizationService", "TenantService",
    function ($scope, immunizationService, $stateParams, $uibModalInstance,
        patientDataService, buttonConfig,
        immunizationServiceClient, tenantService) {
        var vm = this;
        buttonConfig.activeClass = "greybg";
        vm.datepickerOption = {
            "showDropdowns": true,
            calender_style: "picker_3",
            "maxDate": moment(),
            "minDate": patientDataService.getDemographicsData().dob,
            "singleDatePicker": true
        };
        vm.validationError = [];
        function validateForm() {
            vm.validationError = [];
            if (!moment(vm.immunization.administeredDate).isValid()) {
                vm.validationError.push("Invalid Administered Date");
            }
            if (vm.validationError.length > 0) return false;
            return true;
        }
        vm.immunizationCodeData = immunizationServiceClient.getImmunizationCodeData();
        vm.completionStatusCodeData = immunizationServiceClient.getCompletionStatusCodeData();
        vm.informationSourceCodeData = immunizationServiceClient.getInformationSourceCodeData();
        vm.administrationSiteData = tenantService.getAdministrationSiteData();
        function initialize() {
            return {
                immunizationCodeId: 0,
                note: "",
                informationSource: "",
                administrationSiteId: "",
                completionStatusCodeId: "",
                administeredDate: moment(),
                administeredById: "",
                status: ""
            };
        }
        vm.immunization = initialize();
        vm.saveImmunization = function (option) {
            if (!validateForm()) return;
            abp.ui.setBusy();
            immunizationService.createImmunization({
                immunizationCodeId: vm.immunization.immunizationName.immunizationCodeId,
                note: vm.immunization.note,
                informationSource: vm.immunization.InformationSource,
                administrationSiteId: vm.immunization.administrationSiteId.administrationSiteId,
                completionStatusCodeId: vm.immunization.completionStatusCodeId.completionStatusCodeId,
                administeredDate: moment(vm.immunization.administeredDate).utc(),
                status: vm.immunization.status,
                pid: $stateParams.id,
                visitId: $stateParams.visitId
            })
                .success(function () {
                    abp.notify.info(App.localize("SavedSuccessfully"));
                    if (option === "addmore") {
                        vm.immunization = initialize();
                    }
                    else {
                        $uibModalInstance.close();
                        immunizationServiceClient.clearImmunizationData();
                        immunizationServiceClient.getImmunization($stateParams.id);
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
    angular.module("app").controller("app.views.patientdata.immunizationdetail", [
        "$scope", "ImmunizationService", "$stateParams", "$uibModalInstance", "PatientDataService",
    function ($scope, immunizationService, $stateParams, $uibModalInstance, patientDataService) {
        var vm = this;
        vm.datepickerOption = {
            "showDropdowns": true,
            calender_style: "picker_3",
            "maxDate": moment(),
            "minDate": patientDataService.getDemographicsData().dob,
            "singleDatePicker": true,"timePicker": true,
        };
        if (immunizationService.getImmunizationData().length === 0) {
            immunizationService.getImmunization($stateParams.id);
        }

        vm.immunizationData = immunizationService.getImmunizationData();
        vm.itemsByPage = 8;
        vm.searchQuery = "";

        vm.close = function () {
            $uibModalInstance.dismiss();
        };
    }
    ]);

})();


