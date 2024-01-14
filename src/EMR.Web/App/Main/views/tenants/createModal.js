﻿(function () {
    angular.module('app').controller('app.views.tenants.createModal', [
        '$scope', '$uibModalInstance', 'abp.services.app.tenant',
        function ($scope, $uibModalInstance, tenantService) {
            var vm = this;

            vm.tenant = {
                tenancyName: '',
                name: '',
                adminEmailAddress: '',
                connectionString: '',
                password:''
            };

            vm.save = function () {
                abp.ui.setBusy();
                tenantService.createTenant(vm.tenant)
                    .success(function () {
                        abp.notify.info(App.localize('SavedSuccessfully'));
                        $uibModalInstance.close();
                    }).finally(function () {
                        abp.ui.clearBusy();
                    });
            };

            vm.cancel = function () {
                $uibModalInstance.dismiss();
            };
        }
    ]);
})();