window.MonthlyResourcesCnt = ($scope, $routeParams, $http)->
  $http.get('/monthly_resources.json').success (data)->
    console.log(data)
    angular.extend($scope, data)
