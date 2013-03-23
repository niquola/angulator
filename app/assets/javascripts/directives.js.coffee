# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
window.myapp.directive "xselection", () ->
  (scope, element, attrs)->
    active = null
    selectionClass = attrs.xselectionClass || 'active'
    element.delegate attrs.xselection, 'click',->
      active.removeClass(selectionClass) if active
      jQuery(this).addClass(selectionClass)
      active = jQuery(this)

window.dirCnt = ($scope, $http)->
  $scope.items = [{label:'Nicola',mark: 5},{label: 'Mike',mark: 6}]
  $scope.selected = (item)->
    console.log(item.label)

  $http.get('/directives.json').success (data)->
    $scope.items = data


window.myapp.directive "mySelection", () ->
  priority: 0
  #template: "<div></div>"
  #templateUrl: "directive.html"
  #replace: false
  transclude: false
  restrict: "A"
  scope: false
  compile: (tElement, tAttrs, transclude) ->
    console.log('compile',arguments)
    pre: (scope, iElement, iAttrs, controller) ->
      console.log('pre',arguments)

    post: (scope, iElement, iAttrs, controller) ->
      console.log('post',arguments)

  link: (scope, iElement, iAttrs) ->
    console.log('link',arguments)
