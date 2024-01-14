(function () {
    angular.module('app').controller('app.views.patientdata.search', [
        '$scope', '$uibModal', 'abp.services.app.patientData', '$location', "VisitService",
        function ($scope, $uibModal, patientdataService, $location, visitService) {
            var vm = this;
            vm.term = '';
            vm.patientdatas = [];
            vm.resultCount = 0;
            vm.maxPageSize = abp.setting.get("PatientSearchResultPageSize");
            vm.getSearchResult = function (append) {
                if (vm.term.length < 2) return;
                var skipCount = append ? vm.patientdatas.length : 0;
                abp.ui.setBusy(
                $("#searchContent"),
                patientdataService.getSearchResult(
                    {
                        skipCount: skipCount,
                        queryTerm: vm.term
                    }).success(
                    function (result) {
                        if (append) {
                            for (var i = 0; i < result.items.length; i++) {
                                vm.patientdatas.push(result.items[i]);
                            }
                        } else {
                            vm.patientdatas = result.items;
                        }
                        vm.resultCount = result.items.length;
                    }));
            };
            vm.createVisit = abp.auth.isGranted("Pages.PatientView.Visit.Write");

            vm.showMore = function () {
                vm.getSearchResult(true);
            };

            vm.showDetail = function (patient) {
                if (patient.currentlyInVisit) {
                    visitService.getVisitDetailByPid(patient.pid).success(function (result) {
                        abp.ui.setBusy($("#searchContent"),
                        $location.path('patient/view/visit/' + result.id + '/patient/' + patient.pid));
                    });
                } else {
                    abp.ui.setBusy($("#searchContent"),
                            $location.path('patient/view/visit/0/patient/' + patient.pid));
                }
            };

            vm.editProfile = function (patient) {
                abp.ui.setBusy($("#searchContent"),
                                $location.path('patient/edit/' + patient.pid));
            };

            vm.reset = function () {
                angular.copy([], vm.patientdatas);
                vm.resultCount = 0;
            };
            vm.clear = function () {
                vm.reset();
                vm.term = "";
            };
            vm.resumeWorkflow = function (patient) {
                if (patient.currentlyInVisit) {
                    visitService.getVisitDetailByPid(patient.pid).success(function (result) {
                        abp.ui.setBusy($("#searchContent"),
                    $location.path("visitworkflow/visit/" + result.id + "/patient/" + patient.pid));
                    });
                } else {
                    abp.ui.setBusy($("#searchContent"),
                    $location.path("visitworkflow/visit/0/patient/" + patient.pid));
                }
            };

            vm.openVisitHistory = function (patient) {
                abp.ui.setBusy($("#searchContent"),
                 $location.path('patient/visithistory/0/patient/' + patient.pid));
            }
            vm.openAddVisitModal = function (patient) {
                var modalInstance = $uibModal.open({
                    templateUrl: "/App/Main/views/visit/workflow/addvisit.cshtml",
                    controller: "app.views.visit.addvisit as vm",
                    size: "md",
                    resolve: {
                        param: function () {
                            return {
                                'pid': patient.pid
                            };
                        }
                    }
                });
            };

        }
    ]);

    angular.module('app').controller('app.views.patientdata.selectSearch', [
        '$scope', '$uibModalInstance', 'abp.services.app.patientData',
        function ($scope, $uibModalInstance, patientdataService) {
            var vm = this;
            vm.term = '';
            vm.patientdatas = [];
            vm.resultCount = 0;
            vm.maxPageSize = abp.setting.get("PatientSearchResultPageSize");
            vm.getSearchResult = function (append) {
                if (vm.term.length < 2) return;
                var skipCount = append ? vm.patientdatas.length : 0;
                abp.ui.setBusy(
                $("#searchContent"),
                patientdataService.getSearchResult(
                    {
                        skipCount: skipCount,
                        queryTerm: vm.term
                    }).success(
                    function (result) {
                        if (append) {
                            for (var i = 0; i < result.items.length; i++) {
                                vm.patientdatas.push(result.items[i]);
                            }
                        } else {
                            vm.patientdatas = result.items;
                        }
                        vm.resultCount = result.items.length;
                    }));
            };

            vm.showMore = function () {
                vm.getSearchResult(true);
            };

            vm.reset = function () {
                angular.copy([], vm.patientdatas);
                vm.resultCount = 0;
            };
            vm.clear = function () {
                vm.reset();
                vm.term = "";
            };

            vm.select = function (patient) {
                $uibModalInstance.close(patient);
            }
        }
    ]);


})();


