(function () {
    angular.module("app").factory("OutcomeCodeService",
        ["abp.services.app.outcomeCode", function (outcomeCodeService) {
            var outcomeCodeList = [];
            var factory = {
                getOutcomeCode: function () {
                    outcomeCodeService.getOutcomeCode().success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            outcomeCodeList.push(result[i]);
                        }
                    });
                },
                getOutcomeCodeData: function () {
                    if (outcomeCodeList.length === 0)
                        factory.getOutcomeCode();
                    return outcomeCodeList;
                },
                clearOutcomeCodeData: function () {
                    angular.copy([], outcomeCodeList);
                }
            }
            return factory;
        }]);
})();
