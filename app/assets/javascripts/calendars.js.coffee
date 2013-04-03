# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
window.CalendarCnt = ($scope, $routeParams, $http)->
  $http.get('/calendar.json').success (data)->
    angular.extend($scope, data)


window.myapp.
  directive 'calendar', ($document)->
    return (scope, element, attr)->
      numColumns = parseInt(attr.columns)

      spanHeight = 40
      columnWidth = 150

      maxHeight = spanHeight * 24
      maxWidth = (numColumns - 1) * columnWidth
      eventNode = null
      element.css(height: maxHeight, width: numColumns * columnWidth)

      startX=0
      startY=0
      x = 0
      y = 0

      calculateX = (x)->
        x = 0 if x < 0
        x = maxWidth if x > maxWidth
        x = Math.floor((x + columnWidth/2)/columnWidth) * columnWidth
        x

      calculateY = (y) ->
        y = 0 if y < 0
        y = maxHeight if y > maxHeight
        y = Math.floor(y/spanHeight) * spanHeight
        y

      mousemove = (event)->
        dy = calculateY(y + event.screenY - startY)
        dx = calculateX(x + event.screenX - startX)
        eventNode.css(top: dy, left: dx)

      mouseup = ()->
        dy = calculateY(y + event.screenY - startY)
        dx = calculateX(x + event.screenX - startX)
        eventNode.css(top: dy, left: dx,opacity:1)

        $document.unbind('mousemove', mousemove)
        $document.unbind('mouseup', mouseup)
        eventNode = null

      element.delegate '.event','mousedown', (event)->
        eventNode = $(this)
        eventNode.css(opacity: 0.7)
        position = eventNode.position()
        y = position.top
        x = position.left
        startX = event.screenX
        startY = event.screenY

        $document.bind('mousemove', mousemove)
        $document.bind('mouseup', mouseup)
