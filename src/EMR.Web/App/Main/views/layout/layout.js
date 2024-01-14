(function () {
    var controllerId = 'app.views.layout';
    angular.module('app').controller(controllerId, [
        '$scope', "UserPreferenceService", function ($scope, userPreferenceService) {
            var vm = this;
            userPreferenceService.getUserPrefByIdData(abp.session.userId, true);
        }]);
})();