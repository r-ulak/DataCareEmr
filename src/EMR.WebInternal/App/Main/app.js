(function () {
    'use strict';
    
    var app = angular.module('app', [
        'ngAnimate',
        'ngSanitize',

        'ui.router',
        'ui.bootstrap',
        'ui.jq',

        'abp'
    ]);

    //Configuration for Angular UI routing.
    app.config([
        '$stateProvider', '$urlRouterProvider',
        function($stateProvider, $urlRouterProvider) {
            $urlRouterProvider.otherwise('/');

            if (abp.auth.hasPermission('Pages.Users')) {
                $stateProvider
                    .state('users', {
                        url: '/users',
                        templateUrl: '/App/Main/views/users/index.cshtml',
                        menu: 'Users' //Matches to name of 'Users' menu in EMRNavigationProvider
                    });
                $urlRouterProvider.otherwise('/users');
            }
            if (abp.auth.hasPermission('Pages.HostOnly.Jobs')) {
                $stateProvider
                    .state('jobs', {
                        url: '/jobs',
                        templateUrl: '/App/Main/views/jobs/index.cshtml',
                        menu: 'Jobs' //Matches to name of 'Users' menu in EMRNavigationProvider
                    });
                $urlRouterProvider.otherwise('/users');
            }
            $stateProvider
                .state('home', {
                    url: '/',
                    templateUrl: '/App/Main/views/home/home.cshtml',
                    menu: 'Home' //Matches to name of 'Home' menu in EMRNavigationProvider
                })
                .state('about', {
                    url: '/about',
                    templateUrl: '/App/Main/views/about/about.cshtml',
                    menu: 'About' //Matches to name of 'About' menu in EMRNavigationProvider
                });
        }
    ]);
})();