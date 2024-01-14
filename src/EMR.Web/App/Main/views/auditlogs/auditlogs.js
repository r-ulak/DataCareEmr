(function () {
    angular.module('app').factory('AuditLogsService',
        ['abp.services.app.abpAuditLogs', function (abpAuditLogService) {
            var auditLogList = [];
            var factory = {
                getAuditLogsByFilter: function (filter) {
                    abp.ui.setBusy();
                    abpAuditLogService.getAuditLogsByFilter(filter).success(function (result) {
                        for (var i = 0; i < result.length; i++) {
                            auditLogList.push(result[i]);
                        }
                    }).finally(function () {
                        abp.ui.clearBusy();
                    });
                },
                getAuditLogsByFilterData: function (filter) {
                    factory.getAuditLogsByFilter(filter);
                    return auditLogList;
                },
                clearAbpAuditLogByFilterData: function () {
                    angular.copy([], auditLogList);
                }
            };
            return factory;
        }]);

    angular.module('app').controller('app.views.abpAuditLogs.view', [
        '$scope', 'AuditLogsService',
        function ($scope, auditLogService) {
            var vm = this;
            vm.itemsByPage = 10;
            vm.searchQuery = '';
            vm.maxPageSize = abp.setting.get("AuditLogResultPageSize");
            vm.filter = {
                range: {
                    startDate: moment().startOf('day'),
                    endDate: moment().endOf('day')
                },
                dateRange: {
                    startDate: null,
                    endDate: null
                },
                dateFilter: true,
                userName: '',
                userIdFilter: '',
                serviceName: '',
                serviceNameFilter: '',
                executionDurationMin: '',
                executionDurationMax: '',
                executionDurationFilter: '',
                methodName: '',
                methodNameFilter: '',
                browserInfo: '',
                browserInfoFilter: '',
                errorState: '',
                errorStateFilter: '',
                tenantId: '',
                offset: ''
            };

            vm.dateRangeOption = {
                timePicker: true,
                ranges: {
                    'Today': [moment().startOf('day'), moment().endOf('day')],
                    'Yesterday': [moment().subtract(1, 'days').startOf('day'), moment().subtract(1, 'days').endOf('day')],
                    'Last 7 Days': [moment().subtract(6, 'days').startOf('day'), moment().endOf('day')],
                    'Last 30 Days': [moment().subtract(29, 'days').startOf('day'), moment().endOf('day')],
                    'This Month': [moment().startOf('month').startOf('day'), moment().endOf('month').endOf('day')],
                    'Last Month': [moment().subtract(1, 'month').startOf('month').startOf('day'), moment().subtract(1, 'month').endOf('month').endOf('day')]
                }
            };
            vm.search = function () {
                vm.filter.dateFilter = false;
                vm.filter.dateRange.startDate = null;
                vm.filter.dateRange.endDate = null;
                if (vm.filter.range.startDate != null && vm.filter.range.endDate != null) {
                    vm.filter.dateRange.startDate = moment.utc(vm.filter.range.startDate._d).format();
                    vm.filter.dateRange.endDate = moment.utc(vm.filter.range.endDate._d).format();
                    vm.filter.dateFilter = true;
                }
                vm.filter.offset = 0;
                auditLogService.clearAbpAuditLogByFilterData();
                vm.auditLogsData = auditLogService.getAuditLogsByFilterData(vm.filter);
            };
            vm.showMore = function () {
                vm.filter.offset = vm.auditLogsData.length;
                auditLogService.getAuditLogsByFilter(vm.filter);
            };
            vm.search();

        }
    ]);

})();
