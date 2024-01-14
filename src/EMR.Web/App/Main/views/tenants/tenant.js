(function () {
    angular.module("app").factory("TenantService",
          ["abp.services.app.abpTenants", function (tenantService) {
              var administrationSiteList = [];
              var factory = {
                  getAdministrationSite: function () {
                      tenantService.getAdministrationSite({
                      }).success(function (result) {
                          for (var i = 0; i < result.length; i++) {
                              administrationSiteList.push(result[i]);
                          }
                      });
                  },
                  getAdministrationSiteData: function () {
                      if (administrationSiteList.length === 0)
                          factory.getAdministrationSite();
                      return administrationSiteList;
                  },
                  clearAdministrationSiteData: function () {
                      angular.copy([], administrationSiteList);
                  }
              }
              return factory;
          }]);
})();


