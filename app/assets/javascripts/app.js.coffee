window.myapp = angular.module 'myapp', [], ($routeProvider, $locationProvider)->
  $routeProvider.when '/clients/',
    templateUrl: "/clients.tpl"

  $routeProvider.when '/clients/:id/edit',
    templateUrl: "/clients/0/edit.tpl"

  $routeProvider.when '/clients/new',
    templateUrl: "/clients/new.tpl"

  $routeProvider.when '/clients/:id',
    templateUrl: "/clients/0.tpl"

  $routeProvider.when '/calendar',
    templateUrl: "/calendar.tpl"

  $locationProvider.html5Mode(true)
