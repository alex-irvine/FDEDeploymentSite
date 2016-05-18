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
        .when('/Files',
        {
            controller: 'rootController',
            templateUrl: 'app/partials/vwFiles.html'
        })
        .when('/Tutorials',
        {
            controller: 'rootController',
            templateUrl: 'app/partials/vwTutorials.html'
        })
        .otherwise({ redirectTo: '/' });
});

apiDOCS.controller('sidebartestcontroller', function ($scope) {
    $scope.docs = [
        { name: 'News' },
        { name: 'Users' },
        { name: 'Files' },
        { name: 'Tutorials' }
    ];
});