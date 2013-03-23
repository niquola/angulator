# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
window.myapp.filter 'errorCls', ()->
  (input)->
    return input && "error"

window.NewFormCnt = ($scope, $routeParams, $http)->
  $scope.item = {}
  $scope.submit = (ev)->
    $scope.progress = true
    $http.post("/clients.json", client:$scope.item).success (data)->
      $scope.progress = false
      $scope.form.$setPristine()
      $scope.item = data

window.FormCnt = ($scope, $routeParams,$location, $http)->
  if $routeParams.id
    $http.get('/clients/' + $routeParams.id + '.json').success (data)->
      $scope.item = data
  $scope.submit = (ev)->
    $scope.progress = true

    if $routeParams.id
      $http.put("/clients/#{$scope.item.id}.json", client:$scope.item)
        .success (data)->
          console.log('ok', data)
          $scope.progress = false
          $scope.form.$setPristine()
          $scope.item = data
        .error (data)->
          console.log('errors',data)
          $scope.item = data
    else
      $http.post("/clients.json", client:$scope.item)
        .success (data)->
          console.log('ok', data)
          $scope.progress = false
          if data.id
            $location.path("/clients/#{data.id}")
          else
            $scope.form.$setPristine()
            $scope.item = data
        .error (data)->
          $scope.item = data

