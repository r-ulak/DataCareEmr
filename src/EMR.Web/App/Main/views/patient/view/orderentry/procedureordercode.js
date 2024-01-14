(function () {
    angular.module("app").factory("ProcedureOrderCodeService",
        ["abp.services.app.procedureOrder", function (procedureOrderCodeService) {
            var priorityCodeList = [];
            var abnormalCodeList = [];
            var resultStatusCodeList = [];
            var resultDataCodeList = [];
            var specimenCodeList = [];
            var factory = {
                getPriorityCode: function () {
                    procedureOrderCodeService.getPriorityCode().success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            priorityCodeList.push(result[i]);
                        }
                    });
                },
                getPriorityCodeData: function () {
                    if (priorityCodeList.length === 0)
                        factory.getPriorityCode();
                    return priorityCodeList;
                },
                clearPriorityCodeData: function () {
                    angular.copy([], priorityCodeList);
                },
                getSpecimenCode: function () {
                    procedureOrderCodeService.getSpecimenCode().success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            specimenCodeList.push(result[i]);
                        }
                    });
                },
                getSpecimenCodeData: function () {
                    if (specimenCodeList.length === 0)
                        factory.getSpecimenCode();
                    return specimenCodeList;
                },
                clearSpecimenCodeData: function () {
                    angular.copy([], specimenCodeList);
                },
                getAbnormalCode: function () {
                    procedureOrderCodeService.getAbnormalCode().success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            abnormalCodeList.push(result[i]);
                        }
                    });
                },
                getAbnormalCodeData: function () {
                    if (abnormalCodeList.length === 0)
                        factory.getAbnormalCode();
                    return abnormalCodeList;
                },
                clearAbnormalCodeData: function () {
                    angular.copy([], abnormalCodeList);
                },
                getResultStatusCode: function () {
                    procedureOrderCodeService.getResultStatusCode().success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            resultStatusCodeList.push(result[i]);
                        }
                    });
                },
                getResultStatusCodeData: function () {
                    if (resultStatusCodeList.length === 0)
                        factory.getResultStatusCode();
                    return resultStatusCodeList;
                },
                clearResultStatusCodeData: function () {
                    angular.copy([], resultStatusCodeList);
                },
                getResultDataCode: function () {
                    procedureOrderCodeService.getResultDataCode().success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            resultDataCodeList.push(result[i]);
                        }
                    });
                },
                getResultDataCodeData: function () {
                    if (resultDataCodeList.length === 0)
                        factory.getResultDataCode();
                    return resultDataCodeList;
                },
                clearResultDataCodeData: function () {
                    angular.copy([], resultDataCodeList);
                },
                getUnitCode: function (loincCode) {
                    return procedureOrderCodeService.getUnitCode(loincCode);
                }
            }
            return factory;
        }]);
})();
