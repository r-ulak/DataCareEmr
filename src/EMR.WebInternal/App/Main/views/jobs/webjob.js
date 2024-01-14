(function () {
    angular.module("app").factory("AzureIndexService",
        ["abp.services.app.azureIndex", function (azureIndexService) {
            var webJobList = [];
            var webJobCodeList = [];
            var factory = {
                getWebJob: function () {
                    azureIndexService.getAllWebJobs().success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            if (abp.auth.hasPermission(result[i].permissions)) {
                                webJobList.push(result[i]);
                            }
                        }
                    });
                },
                runWebJob: function (job) {
                    azureIndexService.runJob(job).success(function (result) {
                        if (result == true) {
                            abp.notify.info(App.localize('Started Successfully'));
                        }
                        else {
                            abp.notify.error(App.localize('Failed to start the job'));

                        }
                    });
                },
                getWebJobData: function () {
                    if (webJobList.length === 0)
                        factory.getWebJob();
                    return webJobList;
                },
                clearWebJobData: function () {
                    angular.copy([], webJobList);
                }
            }
            return factory;
        }]);

    angular.module("app").controller("app.views.domain.webJob", [
        "$scope", "AzureIndexService", "$window",
        function ($scope, azureIndexService, $window) {
            var vm = this;
            azureIndexService.clearWebJobData();
            vm.webJobData = azureIndexService.getWebJobData();
            vm.runWebJob = function (job) {
                azureIndexService.runWebJob(job);
            }
            vm.runWebJobAndViewStatus = function (job) {
                azureIndexService.runWebJob(job);
                abp.ui.setBusy();
                var url = "http://" + $window.location.host + "/hangfire/jobs/processing";
                setTimeout(function () { $window.location.href = url; }, 3000);

            }
        }
    ]);
})();
