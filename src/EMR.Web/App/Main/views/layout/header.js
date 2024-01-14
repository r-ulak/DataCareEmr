(function () {
    var controllerId = 'app.views.layout.header';
    angular.module('app').controller(controllerId, [
        '$rootScope', '$state', 'appSession','$analytics',
        function ($rootScope, $state, appSession, $analytics) {
            var vm = this;

            vm.languages = abp.localization.languages;
            vm.currentLanguage = abp.localization.currentLanguage;

            vm.menu = abp.nav.menus.MainMenu;
            vm.currentMenuName = $state.current.menu;

            //$analytics.setUserProperties({ Username: appSession.user.userName, TenantId: appSession.tenant.TenancyName});
            //$analytics.setUsername(appSession.user.userName);

            $rootScope.$on('$stateChangeSuccess', function (event, toState, toParams, fromState, fromParams) {
                vm.currentMenuName = toState.menu;
            });

            vm.getShownUserName = function () {
                if (!abp.multiTenancy.isEnabled) {
                    return appSession.user.userName;
                } else {
                    if (appSession.tenant) {
                        return appSession.tenant.tenancyName + '\\' + appSession.user.userName;
                    } else {
                        return '.\\' + appSession.user.userName;
                    }
                }
            };

            abp.event.on('abp.notifications.received', function (userNotification) {
                abp.notifications.showUiNotifyForUserNotification(userNotification);
            });
        }
    ]);
})();