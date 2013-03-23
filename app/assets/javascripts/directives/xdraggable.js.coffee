window.myapp.directive "xdraggable", () ->
  (scope, element, attrs)->
    element.css(position: 'asolute')
    element.on 'mousedown', ->
      element.addClass('active')
      console.log('down',arguments)
    element.on 'mousemove', ->
      console.log('down',arguments)
    .on 'mouseup', ->
      element.removeClass('active')
      console.log('up',arguments)
