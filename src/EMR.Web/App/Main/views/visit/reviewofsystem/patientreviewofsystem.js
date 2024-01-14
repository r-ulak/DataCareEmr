(function () {
    angular.module("app")
        .factory("PatientReviewOfSystemService",
        [
            "abp.services.app.patientReviewOfSystem", "$stateParams",
            function (patientReviewOfSystemService, $stateParams) {
                var reviewOfSystemCodeList = [];
                var reviewOfSystemCodeOddCodeList = [];
                var reviewOfSystemCodeEvenCodeList = [];
                var getallLock = false;
                var factory = {
                    getPatientReviewOfSystemByVisitId: function (pid, visitId, isShortCode) {
                        return patientReviewOfSystemService
                            .getPatientReviewOfSystemDetailByVisitIdAndPid({
                                patientId: pid,
                                visitId: visitId,
                                isShortCode: isShortCode
                            });
                    },
                    getAllReviewOfSystemCode: function (vm) {
                        if (getallLock) return;
                        getallLock = true;
                        patientReviewOfSystemService.getAllReviewOfSystemCode()
                            .success(function (result) {
                                for (var i = 0; i < result.length; i++) {
                                    reviewOfSystemCodeList.push(result[i]);
                                    if (i % 2 === 0) {
                                        reviewOfSystemCodeEvenCodeList.push(result[i]);
                                    } else {
                                        reviewOfSystemCodeOddCodeList.push(result[i]);
                                    }
                                }
                            })
                            .finally(function () {
                                getallLock = false;
                                factory.getCurrentVisitReviewOfSystem(true, vm);
                                factory.getCurrentVisitReviewOfSystem(false, vm);
                            });
                    },

                    createPatientReviewOfSystem: function (patientReviewOfSystem, shortCode) {
                        return patientReviewOfSystemService
                            .createPatientReviewOfSystem({
                                ReviewOfSystem: patientReviewOfSystem,
                                IsShortCode: shortCode
                            });
                    },
                    updatePatientReviewOfSystem: function (patientReviewOfSystem) {
                        return patientReviewOfSystemService
                            .updatePatientReviewOfSystem(patientReviewOfSystem);
                    },
                    getAllReviewOfSystemCodeData: function (vm) {
                        if (reviewOfSystemCodeList.length === 0) {
                            factory.getAllReviewOfSystemCode(vm);
                        } else {
                            _.each(reviewOfSystemCodeList,
                                function (group) {
                                    _.each(group.reviewOfSystemCode,
                                        function (item) {
                                            item.note = "";
                                            item.normalLimits = true;
                                        });
                                });
                            factory.getCurrentVisitReviewOfSystem(true, vm);
                            factory.getCurrentVisitReviewOfSystem(false, vm);
                        }
                        return reviewOfSystemCodeList;
                    },
                    getReviewOfSystemCodeOddCodeList: function () {
                        return reviewOfSystemCodeOddCodeList;
                    },
                    getReviewOfSystemCodeEvenCodeList: function () {
                        return reviewOfSystemCodeEvenCodeList;
                    },
                    saveReviewOfSystem: function (vm, shortCode) {
                        var allRows = _.union(vm.reviewOfSystemCodeEvenData,
                            vm.reviewOfSystemCodeOddData);
                        var listToUpsert = [];
                        _.each(allRows,
                            function (groupItem) {
                                listToUpsert =
                                    _.union(listToUpsert,
                                        _.filter(groupItem.reviewOfSystemCode,
                                            function (item) {
                                                item.visitId = $stateParams.visitId;
                                                item.pid = $stateParams.id;
                                                return ((!_.isNull(item.note) && item.note.length > 0) ||
                                                    item.normalLimits !== true);
                                            }));
                            });
                        if (listToUpsert.length > 0) {
                            abp.ui.setBusy();
                            factory
                                .createPatientReviewOfSystem(listToUpsert, shortCode)
                                .success(function () {
                                    abp.notify.info(App.localize("SavedSuccessfully"));
                                })
                                .finally(function () {
                                    abp.ui.clearBusy();
                                });
                        }
                    },
                    getCurrentVisitReviewOfSystem: function (isShortCode, vm) {
                        if ($stateParams.visitId > 0) {
                            factory
                                .getPatientReviewOfSystemByVisitId($stateParams.id, $stateParams.visitId, isShortCode)
                                .success(function (result) {
                                    for (var i = 0; i < result.length; i++) {
                                        var item = _.findWhere(reviewOfSystemCodeList,
                                        {
                                            reviewOfSystemGroupCodeName: result[i].reviewOfSystemGroupCodeName
                                        });

                                        if (_.isUndefined(item)) continue;
                                        _.each(item.reviewOfSystemCode,
                                            function (system) {
                                                var line = _.findWhere(result[i].reviewOfSystemCode,
                                                {
                                                    reviewOfSystemCodeId: system.reviewOfSystemCodeId
                                                });
                                                if (!_.isUndefined(line)) {
                                                    system.normalLimits = line.normalLimits;
                                                    system.note = line.note;
                                                }
                                            });

                                    }
                                });
                        }
                    },
                    setupReviewOfSystem: function (vm, shortCode) {
                        factory.getAllReviewOfSystemCodeData(vm); //trigger call to server
                        vm.reviewOfSystemCodeEvenData = factory.getReviewOfSystemCodeEvenCodeList();
                        vm.reviewOfSystemCodeOddData = factory.getReviewOfSystemCodeOddCodeList();
                        vm.save = function () {
                            factory.saveReviewOfSystem(vm, shortCode);
                        }
                    },
                    setupReviewOfSystemVisit: function (vm) {
                        vm.readonlyview = true;
                        vm.processed = false;
                        vm.reviewOfSystemCodeOddData = [];
                        vm.reviewOfSystemCodeEvenData = [];
                        vm.getreviewofsystemDetailByPidAndVisitId = function (visitId, isShortCode) {
                            if (!vm.processed) {
                                factory.getPatientReviewOfSystemByVisitId($stateParams.id, visitId, isShortCode)
                                    .success(function (result) {
                                        vm.processed = true;
                                        for (var i = 0; i < result.length; i++) {
                                            if (i % 2 === 0) {
                                                vm.reviewOfSystemCodeEvenData.push(result[i]);
                                            } else {
                                                vm.reviewOfSystemCodeOddData.push(result[i]);
                                            }
                                        }
                                    });
                            }
                        }
                    }

                }
                return factory;
            }
        ]);

    angular.module("app")
        .controller("app.views.paitent.patientreviewofsystemcomprehensive",
        [
            "$scope", "PatientReviewOfSystemService",
            function ($scope, patientReviewOfSystemService) {
                var vm = this;
                vm.compreshensive = true;
                vm.short = false;
                patientReviewOfSystemService.setupReviewOfSystem(vm, vm.short);
            }
        ]);


    angular.module("app")
        .controller("app.views.paitent.patientreviewofsystemshort",
        [
            "$scope", "PatientReviewOfSystemService",
            function ($scope, patientReviewOfSystemService) {
                var vm = this;
                vm.compreshensive = false;
                vm.short = true;
                patientReviewOfSystemService.setupReviewOfSystem(vm, vm.short);

            }
        ]);

    angular.module("app")
        .controller("app.views.patient.patientreviewofsystemcomprehensivevisitdetail",
        [
            "$scope", "PatientReviewOfSystemService",
            function ($scope, patientReviewOfSystemService) {
                var vm = this;
                vm.compreshensive = true;
                vm.short = false;
                patientReviewOfSystemService.setupReviewOfSystemVisit(vm);
            }
        ]);


    angular.module("app")
        .controller("app.views.patient.patientreviewofsystemshortvisitdetail",
        [
            "$scope", "PatientReviewOfSystemService",
            function ($scope, patientReviewOfSystemService) {
                var vm = this;
                vm.compreshensive = false;
                vm.short = true;
                patientReviewOfSystemService.setupReviewOfSystemVisit(vm);
            }
        ]);
})();
