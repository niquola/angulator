window.NewRoadmapCnt = ($scope, $routeParams, $http, $location)->
  $scope.item = {}
  $scope.submit = (ev)->
    $scope.progress = true
    $http.post("/roadmaps.json", item: $scope.item)
      .success (data)->
        $location.path("/roadmaps/#{data.id}")
      .error (data)->
        console.log(arguments)

window.RoadmapCnt = ($scope, $routeParams, $http)->
  TRIMM_REGX = /(^\s*|\s*$)/
  MILESTONE_REGX = /^\*\s*/
  $scope.parse = ->
    return unless $scope.item.description
    $scope.roads = []
    last_road = null
    $scope.item.description.split("\n").forEach (line)->
      line = line.replace(TRIMM_REGX,'')
      return unless line
      if line.match(MILESTONE_REGX)
        if last_road
          ms = line.replace(MILESTONE_REGX,'')
          last_road.milestones.push(name: ms,length: 3) if ms
      else
        last_road = {name: line, milestones: []}
        $scope.roads.push(last_road)
  $scope.$watch 'item', ->
    $scope.parse() if $scope.item
