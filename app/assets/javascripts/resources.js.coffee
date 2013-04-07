# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
window.ResourcesCnt = ($scope, $routeParams, $http)->
  $scope.date = new Date()

  $scope.prevDay = ->
    $scope.date = new Date($scope.date - 1000*60*60*24)

  $scope.nextDay = ->
    $scope.date = new Date( +$scope.date + 1000*60*60*24)

  $scope.onSlot = (res, slot)->
    slot.resource = res
    $scope.currentSlot = slot

  $http.get('/resources.json').success (data)->
    angular.extend($scope, data)
