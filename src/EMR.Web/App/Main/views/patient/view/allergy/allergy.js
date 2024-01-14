(function () {
    angular.module('app').factory('AllergyService',
        ['abp.services.app.patientAllergy', function (allergyService) {
            var allergyList = [];
            var allergyListBeingPopulated = false;
            var allergyCodeList = [];
            var allergyReactionCodeList = [];
            var allergyCategoryCodeList = [];
            var allergyTypeCodeList = [];
            var factory = {
                getAllergy: function (pid) {
                    allergyListBeingPopulated = true;
                    allergyService.getPatientAllergy({
                        patientId: pid
                    }).success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            allergyList.push(result[i]);
                        }
                    }).finally(function () {
                        allergyListBeingPopulated = false;
                    });
                },
                getAllergyTypeCode: function () {
                    allergyService.getAllergyTypeCode({
                    }).success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            allergyTypeCodeList.push(result[i]);
                        }
                    });
                },
                getAllergyCategoryCode: function () {
                    allergyService.getAllergyCategoryCode({
                    }).success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            allergyCategoryCodeList.push(result[i]);
                        }
                    });
                },
                getAllergyReactionCode: function () {
                    allergyService.getAllergyReactionCode({
                    }).success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            allergyReactionCodeList.push(result[i]);
                        }
                    });
                },
                getAllergyCode: function () {
                    allergyService.getAllergyCode({
                    }).success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            allergyCodeList.push(result[i]);
                        }
                    });
                },
                updateAllergy: function (allergy, dob) {
                    allergy.dob = dob;
                    allergyService.updateAllergy(allergy).success(function () {
                        abp.notify.info(App.localize('UpdatedSuccessfully'));
                    });
                },
                getAllergyCategoryCodeData: function () {
                    if (allergyCategoryCodeList.length === 0)
                        factory.getAllergyCategoryCode();
                    return allergyCategoryCodeList;
                },
                getAllergyReactionCodeData: function () {
                    if (allergyReactionCodeList.length === 0)
                        factory.getAllergyReactionCode();
                    return allergyReactionCodeList;
                },
                getAllergyTypeCodeData: function () {
                    if (allergyTypeCodeList.length === 0)
                        factory.getAllergyTypeCode();
                    return allergyTypeCodeList;
                },
                getAllergyCodeData: function () {
                    if (allergyCodeList.length === 0)
                        factory.getAllergyCode();
                    return allergyCodeList;
                },
                getAllergyData: function (pid) {
                    if (allergyListBeingPopulated === false) {
                        if (allergyList.length === 0)
                            factory.getAllergy(pid);
                    }
                    return allergyList;
                },
                clearAllergyData: function () {
                    angular.copy([], allergyList);
                }
            }
            return factory;
        }]);

    angular.module('app').controller('app.views.patientdata.allergy', [
        '$scope', 'AllergyService', '$stateParams', '$uibModal',
        function ($scope, allergyService, $stateParams, $uibModal) {
            var vm = this;

            allergyService.clearAllergyData();
            vm.allergyData = allergyService.getAllergyData($stateParams.id);
            vm.itemsByPage = 3;
            vm.searchQuery = '';

            vm.openAllergyDetailModal = function () {
                var modalInstance = $uibModal.open({
                    templateUrl: '/App/Main/views/patient/view/allergy/allergydetail.cshtml',
                    controller: 'app.views.patientdata.allergydetail as vm',
                    size: 'lg',
                });
            };
            vm.openAddAllergyModal = function () {
                var modalInstance = $uibModal.open({
                    templateUrl: '/App/Main/views/patient/view/allergy/addallergy.cshtml',
                    controller: 'app.views.patientdata.addallergy as vm',
                    size: 'smd',
                });
            };
        }
    ]);
    angular.module('app').controller('app.views.patientdata.addallergy', [
        '$scope', 'abp.services.app.patientAllergy', '$stateParams', '$uibModalInstance', 'PatientDataService', 'uibButtonConfig', 'AllergyService',
    function ($scope, allergyService, $stateParams, $uibModalInstance, patientDataService, buttonConfig, allergyServiceClient) {
        var vm = this;

        buttonConfig.activeClass = 'greybg';
        vm.datepickerOption = {
            "showDropdowns": true,
            calender_style: "picker_3",
            "maxDate": moment(),
            "minDate": patientDataService.getDemographicsData().dob,
            "singleDatePicker": true, "timePicker": true,
        };
        vm.validationError = [];
        function validateForm() {
            vm.validationError = [];
            if (vm.allergy.allergyType == '') {
                vm.validationError.push('Allergy Type is requried');
            }

            if (vm.allergy.severityId == '') {
                vm.validationError.push('SeverityId is requried');
            }
            if (vm.validationError.length > 0) return false;
            return true
        }
        vm.allergyCodeData = allergyServiceClient.getAllergyCodeData();
        vm.allergyReactionCodeData = allergyServiceClient.getAllergyReactionCodeData();
        vm.allergyCategryCodeData = allergyServiceClient.getAllergyCategoryCodeData();
        vm.allergyTypeCodeData = allergyServiceClient.getAllergyTypeCodeData();
        function initialize() {
            return {
                allergyName: '',
                allergyType: '',
                reactionName: '',
                severityId: '',
                allergyCategory: '',
                allergyCategoryCodeId: '',
                note: '',
                Status: 'active',
                startDate: ''
            };
        }
        vm.allergy = initialize();
        vm.saveAllergy = function (option) {
            if (!validateForm()) return;
            abp.ui.setBusy();
            allergyService.createAllergy({
                allergyName: vm.allergy.allergyName,
                allergyTypeId: vm.allergy.allergyType.allergyTypeId,
                reactionName: vm.allergy.reactionName,
                severityId: vm.allergy.severityId,
                allergyCategoryCodeId: vm.allergy.allergyCategory.allergyCategoryCodeId,
                note: vm.allergy.note,
                Status: 'active',
                pid: $stateParams.id,
                visitId: $stateParams.visitId,
                startDate: vm.allergy.startDate
            })
                .success(function () {
                    abp.notify.info(App.localize('SavedSuccessfully'));
                    if (option == 'addmore') {
                        vm.allergy = initialize();
                    }
                    else {
                        $uibModalInstance.close();
                        allergyServiceClient.clearAllergyData();
                        allergyServiceClient.getAllergy($stateParams.id);
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
    angular.module('app').controller('app.views.patientdata.allergydetail', [
        '$scope', 'AllergyService', '$stateParams', '$uibModalInstance', 'PatientDataService',
    function ($scope, allergyService, $stateParams, $uibModalInstance, patientDataService) {
        var vm = this;
        vm.datepickerOption = {
            "showDropdowns": true,
            calender_style: "picker_3",
            "maxDate": moment(),
            "minDate": patientDataService.getDemographicsData().dob,
            "singleDatePicker": true, "timePicker": true,
        };

        vm.allergyData = allergyService.getAllergyData($stateParams.id);
        vm.itemsByPage = 10;
        vm.searchQuery = '';
        vm.update = function (allergy) {
            if (angular.isDate(allergy.startDate)) {
                abp.notify.error(App.localize('Invalid Date'));
            }
            allergyService.updateAllergy(allergy, patientDataService.getDemographicsData().dob);
        }
        vm.close = function () {
            $uibModalInstance.dismiss();
        };
    }
    ]);
    angular.module('app').controller('app.views.patientdata.allergytop', [
        'AllergyService', '$stateParams',
    function (allergyService, $stateParams) {
        var vm = this;
        vm.allergyTop3 = allergyService.getAllergyData($stateParams.id);
    }
    ]);

})();


