window.RoadmapCnt = ($scope, $routeParams, $http)->
  $scope.parse = ->
    roads = []
    last_road = null
    $scope.item.description.split("\n").forEach (i)->
      if i.match(/^\*/)
        if last_road
          ms = i.replace(/^\s*\*\s*/,'')
          last_road.milestones.push(name: ms,length: 3) if ms
      else
        last_road = {name: i, milestones: []} if i
        roads.push(last_road)
    #console.log(roads)
    $scope.roads = roads
  $scope.$watch 'item', ->
    $scope.parse() if $scope.item
