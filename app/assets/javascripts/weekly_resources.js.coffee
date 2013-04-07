window.WeeklyResourcesCnt = ($scope, $routeParams, $http)->
  $http.get('/weekly_resources.json').success (data)->
    angular.extend($scope, data)
