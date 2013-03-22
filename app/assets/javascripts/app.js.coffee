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

  $routeProvider.when '/directives',
    templateUrl: "/directives.tpl"

  $routeProvider.when '/roadmaps',
    templateUrl: "/roadmaps.tpl"

  $routeProvider.when '/roadmaps/:id',
    templateUrl: "/roadmaps/0.tpl"

  $locationProvider.html5Mode(true)
