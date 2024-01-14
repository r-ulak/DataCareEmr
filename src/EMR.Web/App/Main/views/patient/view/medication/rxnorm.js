(function () {
    angular.module("app")
        .factory("RxNormService",
        [
            "$http", "$q", function ($http, $q) {
                var baseUrl = "https://rxnav.nlm.nih.gov/REST/Prescribe/";
                var maxEntriesApporximateTerm = 10;
                var autoSuggestList = [];
                var rxNormCache = true;
                var factory = {
                    queryRxNormApproximate: function (medname) {
                        angular.copy([], autoSuggestList);
                        return $http.get(baseUrl + "approximateTerm.json",
                            {
                                params: {
                                    term: medname,
                                    maxEntries: maxEntriesApporximateTerm
                                },
                                cache: rxNormCache
                            })
                            .then(function (response) {
                                var candidates = response.data.approximateGroup.candidate;
                                var callPromises = [];
                                _.each(candidates,
                                    function (candidate) {
                                        callPromises.push(factory.getRxNormName(candidate.rxcui));
                                    });
                                return $q.all(callPromises);

                            });
                    },
                    getRxNormName: function (rxcuid) {
                        return $http.get(baseUrl + "rxcui/" + rxcuid + ".json", { cache: rxNormCache });
                    },
                    getRxNormApproximateData: function (medname) {
                        factory.queryRxNormApproximate(medname);
                        return autoSuggestList;
                    }

                }
                return factory;
            }
        ]);
})();
