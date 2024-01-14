(function () {
    angular.module('app').factory('UserPreferenceService',
        ['abp.services.app.userPreference', function (userService) {
            var user = {
                administrationSiteId: 0,
                calendarColor: ""
            };
            var factory = {
                getUserPrefById: function (id) {
                    userService.getUserPreferenceDetailByid(
                        {
                            loggedUserId: id
                        }
                        ).success(function (result) {
                            if (_.isNull(result)) return;
                            user.administrationSiteId = result.administrationSiteId;
                            user.calendarColor = result.calendarColor;
                        });
                },
                getUserPrefByIdData: function (id, cachedResultOk) {
                    if (user.administrationSiteId === 0 || !cachedResultOk) {
                        return factory.getUserPrefById(id);
                    }
                    return user;
                }
            }
            return factory;
        }]);
})();
