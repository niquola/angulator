# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


window.myapp.
  directive 'calendar', ($document)->
    restrict: 'A'
    compile: (element, attr)->
      (scope, element, attr)->
        table = $('<table class="table table-bordered">').appendTo(element)
        watcher = (val)->
          tss = scope[attr.timeSlots]
          cols = scope[attr.columns]
          content = ['<tr><th/>']
          content.push "<th>#{c}</th>" for c in cols
          content.push "</tr>"
          for ts in tss
            content.push "<tr><td>#{ts}</td>"
            content.push "<td></td>" for c in cols
            content.push "</tr>"
          table.html(content.join(""))

        scope.$watch(attr.timeSlots, watcher, true)

window.CalTestCnt = ($scope, $routeParams, $http)->
  $scope.times = ['a','b']
  $scope.cols = ['a','b']
  $scope.addMore = ()->
    $scope.times.push('ups')
    $scope.cols.push('ups')

# window.myapp.
#   directive 'calendar', ($document)->
#     return (scope, element, attr)->
#       numColumns = parseInt(attr.columns)

#       spanHeight = 40
#       columnWidth = 150

#       maxHeight = spanHeight * 24
#       maxWidth = (numColumns - 1) * columnWidth
#       eventNode = null
#       element.css(height: maxHeight, width: numColumns * columnWidth)

#       startX=0
#       startY=0
#       x = 0
#       y = 0

#       calculateX = (x)->
#         x = 0 if x < 0
#         x = maxWidth if x > maxWidth
#         x = Math.floor((x + columnWidth/2)/columnWidth) * columnWidth
#         x

#       calculateY = (y) ->
#         y = 0 if y < 0
#         y = maxHeight if y > maxHeight
#         y = Math.floor(y/spanHeight) * spanHeight
#         y

#       mousemove = (event)->
#         dy = calculateY(y + event.screenY - startY)
#         dx = calculateX(x + event.screenX - startX)
#         eventNode.css(top: dy, left: dx)

#       mouseup = ()->
#         dy = calculateY(y + event.screenY - startY)
#         dx = calculateX(x + event.screenX - startX)
#         eventNode.css(top: dy, left: dx,opacity:1)

#         $document.unbind('mousemove', mousemove)
#         $document.unbind('mouseup', mouseup)
#         eventNode = null

#       element.delegate '.event','mousedown', (event)->
#         eventNode = $(this)
#         eventNode.css(opacity: 0.7)
#         position = eventNode.position()
#         y = position.top
#         x = position.left
#         startX = event.screenX
#         startY = event.screenY

#         $document.bind('mousemove', mousemove)
#         $document.bind('mouseup', mouseup)
