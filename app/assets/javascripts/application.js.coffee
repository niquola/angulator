# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.
#
# WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
# GO AFTER THE REQUIRES BELOW.
#
#= require jquery
#= require jquery_ujs
#= require 'lib/angular'
#= require_self
#= require_tree .
#= require_tree ./directives
#
##= require twitter/bootstrap
window.myapp = angular.module 'myapp', [], ($routeProvider, $locationProvider)->
  resources = (name)->
    $routeProvider.when "/#{name}/",
      templateUrl: "/#{name}.tpl"

    $routeProvider.when "/#{name}/:id/edit",
      templateUrl: "/#{name}/0/#{name}.tpl"

    $routeProvider.when "/#{name}/new",
      templateUrl: "/#{name}/new.tpl"

    $routeProvider.when "/#{name}/:id",
      templateUrl: "/#{name}/0.tpl"

  resources 'clients'
  resources 'calendar'
  resources 'directives'
  resources 'roadmaps'
  resources 'resources'
  resources 'monthly_resources'
  resources 'weekly_resources'

  $locationProvider.html5Mode(true)
