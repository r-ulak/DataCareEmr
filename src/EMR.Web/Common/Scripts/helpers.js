var App = App || {};
(function () {

    var appLocalizationSource = abp.localization.getSource('EMR');
    App.localize = function () {
        return appLocalizationSource.apply(this, arguments);
    };

})(App);