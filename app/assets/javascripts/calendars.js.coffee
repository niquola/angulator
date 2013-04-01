# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
window.CalendarCnt = ($scope, $routeParams, $http)->
  vertical_step = 50

  $scope.setCurrentEvent = (event, ev)->
    $scope.currentEvent = event
    jQuery('#event-form').show()

  $scope.closeEvent = ()->
    $scope.currentEvent = null

  #FIXME: implement as filter
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
    return (scope, element, attr)->
      startX=0
      startY=0
      x = 0
      y = 0
      mousemove = (event)->
        dy = event.screenY - startY
        dx = event.screenX - startX
        element.css(top: y + dy + 'px', left:  x + dx + 'px')

      mouseup = ()->
        $document.unbind('mousemove', mousemove)
        $document.unbind('mouseup', mouseup)

      element.bind 'mousedown', (event)->
        element.css(position: 'absolute', cursor: 'pointer')
        position = element.position()
        y = position.top
        x = position.left
        startX = event.screenX
        startY = event.screenY
        $document.bind('mousemove', mousemove)
        $document.bind('mouseup', mouseup)
