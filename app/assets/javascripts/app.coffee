pms = angular.module('pms',[
  'templates',
  'ngRoute',
  'controllers',
  'ngResource',
  'ui.router',
  'angular-flash.service',
  'angular-flash.flash-alert-directive'
])

pms.config([ '$routeProvider', 'flashProvider',
  ($routeProvider,flashProvider)->
    flashProvider.errorClassnames.push("alert-danger")
    flashProvider.warnClassnames.push("alert-warning")
    flashProvider.infoClassnames.push("alert-info")
    flashProvider.successClassnames.push("alert-success")
    $routeProvider
      .when('/',
         templateUrl: "index.html"
         controller: 'PropertiesController'
      ).when('/properties/new',
        templateUrl: "form.html"
        controller: 'PropertyController'
      ).when('/properties/:propertyId',
         templateUrl: "show.html"
         controller: 'PropertyController'
      ).when('/properties/:propertyId/edit',
        templateUrl: "form.html"
        controller: 'PropertyController'
      )
])

controllers = angular.module('controllers',[])