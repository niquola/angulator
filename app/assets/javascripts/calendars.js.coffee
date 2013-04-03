# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
window.CalendarCnt = ($scope, $routeParams, $http)->
  vertical_step = 50
  $scope.height = 40*24
  $scope.width = 450
  $scope.columnWidth = 150
  $scope.spanHeight = 20

  $http.get('/calendar.json').success (data)->
    angular.extend($scope, data)


window.myapp.
  directive 'draggable', ($document)->
    return (scope, element, attr)->
      spanHeight = scope.spanHeight
      columnWidth = scope.columnWidth
      maxHeight = scope.height
      maxWidth = scope.width - columnWidth

      startX=0
      startY=0
      x = 0
      y = 0

      calculateX = (x)->
        x = 0 if x < 0
        x = maxWidth if x > maxWidth
        x

      calculateY = (y) ->
        y = 0 if y < 0
        y = maxHeight if y > maxHeight
        y

      mousemove = (event)->
        dy = y + event.screenY - startY
        dx = x + event.screenX - startX
        dy = Math.floor(dy/spanHeight) * spanHeight
        dx = Math.floor((dx + columnWidth/2)/columnWidth) * columnWidth
        element.css(top: dy, left: dx)

      mouseup = ()->
        dy = calculateY(y + event.screenY - startY)
        dx = calculateX(x + event.screenX - startX)
        dy = Math.floor(dy/spanHeight) * spanHeight
        dx = Math.floor((dx + columnWidth/2)/columnWidth) * columnWidth
        element.css(top: dy, left: dx,opacity:1)

        $document.unbind('mousemove', mousemove)
        $document.unbind('mouseup', mouseup)

      element.mousedown (event)->
        element.css(opacity: 0.7)
        position = element.position()
        y = position.top
        x = position.left
        startX = event.screenX
        startY = event.screenY

        $document.bind('mousemove', mousemove)
        $document.bind('mouseup', mouseup)
