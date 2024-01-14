(function () {
    angular.module("app")
        .factory("VisitService",
        [
            "abp.services.app.visit", "UserService", function (visitService, userService) {
                var visitHistoryList = [];
                var activevisitList = [];
                var visitCodeList = [];
                var visitStatusCodeList = [];
                var factory = {
                    getActiveVisitByLoggedInUser: function (filterByLoggedInUser) {
                        visitService.getActiveVisitByLoggedInUser({
                            FilterByLoggedUser: filterByLoggedInUser
                        })
                            .success(function (result) {
                                for (var i = 0; i < result.length; i++) {
                                    result[i].doctor = _.find(userService.getAllUsersWithRoleData(),
                                        function (item) {
                                            return item.id === result[i].doctorId;
                                        });
                                    result[i].nurse = _.find(userService.getAllUsersWithRoleData(),
                                        function (item) {
                                            return item.id === result[i].nurseId;
                                        });
                                    activevisitList.push(result[i]);
                                }
                            });
                    },
                    getVisitDetailByPid: function (pid) {
                        return visitService.getVisitDetailByPid({
                            PatientId: pid
                        });

                    },
                    getVisitHistory: function (pid) {
                        visitService.getVisitHistoryByPid({
                            patientId: pid
                        }).success(function (result) {
                            for (var i = 0; i < result.length; i++) {
                                visitHistoryList.push(result[i]);
                            }
                        });
                    },
                    getVisitCode: function () {
                        visitService.getVisitCode()
                            .success(function (result) {
                                for (var i = 0; i < result.length; i++) {
                                    visitCodeList.push(result[i]);
                                }
                            });
                    },
                    getVisitStatusCode: function () {
                        visitService.getVisitStatusCode()
                            .success(function (result) {
                                for (var i = 0; i < result.length; i++) {
                                    visitStatusCodeList.push(result[i]);
                                }
                            });
                    },
                    getVisitStatusCodeData: function () {
                        if (visitStatusCodeList.length === 0)
                            factory.getVisitStatusCode();
                        return visitStatusCodeList;
                    },
                    createVisit: function (visit) {
                        return visitService.createVisit(visit);
                    },
                    updateVisit: function (visit) {
                        return visitService.updateVisit(visit);
                    },
                    getVisitCodeData: function () {
                        if (visitCodeList.length === 0)
                            factory.getVisitCode();
                        return visitCodeList;
                    },
                    getActiveVisitData: function (filterByLoggedInUser) {
                        angular.copy([], activevisitList);
                        factory.getActiveVisitByLoggedInUser(filterByLoggedInUser);
                        return activevisitList;
                    },
                    getVisitHistoryData: function (pid) {
                        angular.copy([], visitHistoryList);
                        factory.getVisitHistory(pid);
                        return visitHistoryList;
                    },

                }
                return factory;
            }
        ]);

    angular.module("app")
        .controller("app.views.visit.addvisit",
        [
            "$scope", "VisitService", "$uibModalInstance", "uibButtonConfig", "param", "$location", "UserService",
            "TenantService",
            function ($scope,
                visitService,
                $uibModalInstance,
                buttonConfig,
                patientParam,
                $location,
                userService,
                tenantService) {
                var vm = this;
                buttonConfig.activeClass = "greybg";
                vm.allUserData = userService.getAllUsersWithRoleData();
                vm.visitCodeData = visitService.getVisitCodeData();
                vm.administrationSiteData = tenantService.getAdministrationSiteData();

                function initialize() {
                    return {
                        pid: patientParam.pid,
                        visitCodeId: "",
                        administrationSiteId: "",
                        doctorId: "",
                        nurseId: "",
                        reason: ""
                    };
                }

                vm.visit = initialize();
                vm.saveVisit = function () {
                    abp.ui.setBusy();
                    visitService.createVisit(vm.visit)
                        .success(function (result) {
                            abp.notify.info(App.localize("SavedSuccessfully"));
                            $uibModalInstance.dismiss();
                            $location.path("visitworkflow/visit/" + result + "/patient/" + patientParam.pid);
                        })
                        .finally(function () {
                            abp.ui.clearBusy();
                        });
                }
                vm.close = function () {
                    $uibModalInstance.dismiss();
                };
            }
        ]);
    angular.module("app")
        .controller("app.views.visit.activevisit",
        [
            "$scope", "VisitService", "UserService", "TenantService", '$location',
            function ($scope, visitService, userService, tenantService, $location) {
                var vm = this;
                vm.filterByloggedInUser = true;
                vm.skipCountAll = 0;
                vm.itemsByPage = 7;
                vm.searchQuery = "";
                vm.allUserData = userService.getAllUsersWithRoleData();
                vm.visitCodeData = visitService.getVisitCodeData();
                vm.visitStatusCodeData = visitService.getVisitStatusCodeData();
                vm.showActiveVisit = abp.auth.isGranted("Pages.PatientView.ActiveVisit.Read");
                vm.administrationSiteData = tenantService.getAdministrationSiteData();
                vm.activevisit = visitService.getActiveVisitData(vm.filterByloggedInUser);
                vm.showActiveVisitUpdate = abp.auth.isGranted("Pages.PatientView.ActiveVisit.Write");
                vm.showDetail = function (patient) {
                    abp.ui.setBusy($("#activevisit"),
                    $location.path('patient/view/visit/' + patient.id + '/patient/' + patient.pid));
                };
                vm.resumeWorkflow = function (patient) {
                    abp.ui.setBusy($("#activevisit"),
                $location.path("visitworkflow/visit/" + patient.id + "/patient/" + patient.pid));
                };
                vm.openVisitHistory = function (patient) {
                    abp.ui.setBusy($("#activevisit"),
                     $location.path('patient/visithistory/' + patient.id + '/patient/' + patient.pid));
                }
                vm.updateActiveVisit = function () {
                    visitService.getActiveVisitData(vm.filterByloggedInUser);
                }
                vm.save = function (patient) {
                    abp.ui.setBusy();
                    if (patient.doctor) {
                        patient.doctorId = patient.doctor.id;
                    }
                    if (patient.nurse) {
                        patient.nurseId = patient.nurse.id;
                    }
                    visitService.updateVisit(patient)
                                   .success(function () {
                                       abp.notify.info(App.localize("SavedSuccessfully"));
                                   }).finally(function () {
                                       abp.ui.clearBusy();
                                   });
                }
            }
        ]);
    angular.module("app")
    .controller("app.views.visit.visithistory",
    [
        "$scope", "VisitService", "$stateParams", "StatusCodeService", function ($scope, visitService, $stateParams, statusCodeService) {
            var vm = this;
            vm.itemsByPage = 8;
            statusCodeService.getStatusCodeData();
            vm.searchQuery = "";
            vm.readonlyview = true;
            vm.visitData = visitService.getVisitHistoryData($stateParams.id);
        }
    ]);
    angular.module("app")
       .controller("app.views.visit.dashboard",
       [function () {
           var vm = this;
           vm.showActiveVisit = abp.auth.isGranted("Pages.PatientView.ActiveVisit.Read");
       }
       ]);
})();
