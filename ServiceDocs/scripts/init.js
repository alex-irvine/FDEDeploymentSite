var apiDOCS = angular.module("apiDocs", ['ngRoute']);

apiDOCS.config(function ($routeProvider) {
    $routeProvider
        .when('/',
        {
            controller: 'rootController',
            templateUrl: 'app/partials/vwRoot.html'
        })
        .when('/News',
        {
            controller: 'rootController',
            templateUrl: 'app/partials/vwNews.html'
        })
        .when('/Users',
        {
            controller: 'rootController',
            templateUrl: 'app/partials/vwUsers.html'
        })
        .otherwise({ redirectTo: '/' });
});

apiDOCS.controller('sidebartestcontroller', function ($scope) {
    $scope.docs = [
        { name: 'News' },
        { name: 'Users' }
    ];
});