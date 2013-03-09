# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
window.CalendarCnt = ($scope, $routeParams, $http)->
  $http.get('/calendar.json').success (data)->
    console.log(data)
    $scope.hours = data.hours
    $scope.days = data.days
  $scope.addEvent = (day, hour)->
    $scope.newEvent = {day: day, hour: hour}
    console.log($scope.newEvent)
