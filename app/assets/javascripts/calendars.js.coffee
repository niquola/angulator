# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
window.CalendarCnt = ($scope, $routeParams, $http)->
  vertical_step = 50
  $scope.eventPosition = (ev)->
    top = ev.time * vertical_step - 1
    height = ev.duration * vertical_step
    {top: "#{top}px", height: "#{height}px"}

  $scope.pick = (ev,res)->
    $scope.selectedHour = Math.floor(ev.offsetY/vertical_step)
    $scope.currentResource = res

  $http.get('/calendar.json').success (data)->
    angular.extend($scope, data)


window.myapp.
  directive 'draggable', ($document)->
    startX=0
    startY=0
    x = 0
    y = 0
    return (scope, element, attr)->
      mousemove = (event)->
        y = event.screenY - startY
        x = event.screenX - startX
        element.css(top: y + 'px', left:  x + 'px')

      mouseup = ()->
        $document.unbind('mousemove', mousemove)
        $document.unbind('mouseup', mouseup)
        element.css
          position: 'absolute',
          cursor: 'pointer'

      element.bind 'mousedown', (event)->
        startX = event.screenX - x
        startY = event.screenY - y
        $document.bind('mousemove', mousemove)
        $document.bind('mouseup', mouseup)
