(function () {
    angular.module("app").factory("StatusCodeService",
        ["abp.services.app.statusCode", function (statusCodeService) {
            var statusCodeList = [];
            var factory = {
                getStatusCode: function () {
                    statusCodeService.getStatusCode().success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            statusCodeList.push(result[i]);
                        }
                    });
                },
                getStatusCodeData: function () {
                    if (statusCodeList.length === 0)
                        factory.getStatusCode();
                    return statusCodeList;
                },
                clearStatusCodeData: function () {
                    angular.copy([], statusCodeList);
                }
            }
            return factory;
        }]);
})();
