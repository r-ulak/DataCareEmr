(function () {
    angular.module('app').factory('PatientDataService',
        ['abp.services.app.patientData', '$location',
            function (patientdataService, $location) {
                var factory = {
                    getPatientData: function (pid) {
                        patientdataService.getPatientData({
                            patientId: pid
                        }).success(function (result) {
                            patientDemographics.pid = pid;
                            patientDemographics.fname = result.fname;
                            patientDemographics.lname = result.lname;
                            patientDemographics.mname = result.mname;
                            patientDemographics.dob = result.dob;
                            patientDemographics.street = result.street;
                            patientDemographics.postalCode = result.postalCode;
                            patientDemographics.city = result.city;
                            patientDemographics.state = result.state;
                            patientDemographics.countryCode = result.countryCode;
                            patientDemographics.driversLicense = result.driversLicense;
                            patientDemographics.identificationNumber = result.identificationNumber;
                            patientDemographics.phoneHome = result.phoneHome;
                            patientDemographics.emergencyContactPhone = result.emergencyContactPhone;
                            patientDemographics.emergencyContactName = result.emergencyContactName;
                            patientDemographics.contactRelationship = result.contactRelationship;
                            patientDemographics.phoneCell = result.phoneCell;
                            patientDemographics.gender = result.gender;
                            patientDemographics.email = result.email;
                            patientDemographics.race = result.race;
                            patientDemographics.ethnicity = result.ethnicity;
                            patientDemographics.billingnote = result.billingnote;
                            patientDemographics.deceasedDate = result.deceasedDate;
                            patientDemographics.deceasedReason = result.deceasedReason;
                            patientDemographics.county = result.county;
                            patientDemographics.display = true;
                        });
                    },
                    getDemographicsData: function () {
                        return patientDemographics;
                    },
                    createPatient: function (patient) {
                        abp.ui.setBusy();
                        patientdataService
                           .create(patient)
                           .success(function (pid) {
                               abp.notify.success("Successfully saved.");
                               $location.path('/');
                           }).finally(function () {
                               abp.ui.clearBusy();
                           });
                    },
                    updatePatient: function (patient) {
                        abp.ui.setBusy();
                        patientdataService
                           .updatePatient(patient)
                           .success(function (pid) {
                               abp.notify.success("Successfully saved.");
                           }).finally(function () {
                               abp.ui.clearBusy();
                           });
                    },
                    getPatientDataInstance: function () {
                        return {
                            pid: '',
                            display: false,
                            fname: '',
                            lname: '',
                            mname: '',
                            dob: moment(),
                            street: '',
                            postalCode: '',
                            city: '',
                            state: '',
                            county: '',
                            countryCode: '',
                            driversLicense: '',
                            identificationNumber: '',
                            phoneHome: '',
                            emergencyContactPhone: '',
                            emergencyContactName: '',
                            contactRelationship: '',
                            phoneCell: '',
                            gender: '',
                            email: '',
                            race: '',
                            ethnicity: '',
                            billingNote: '',
                            deceasedDate: '',
                            deceasedReason: '',
                        };
                    }
                }
                var patientDemographics = factory.getPatientDataInstance();

                return factory;
            }]);

    angular.module('app').controller('app.views.patientdata.patient', [
        '$scope', '$uibModal', 'PatientDataService',
        function ($scope, $uibModal, patientdataService) {
            var vm = this;
            vm.patientData = patientdataService.getDemographicsData();
        }
    ]);
})();


