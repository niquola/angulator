window.GridCnt = ($scope, $http, $location)->
 itemsUrl = "#{$location.absUrl().replace(/\/$/,'')}.json"
 $scope.page = 0
 $scope.loading = false
 $scope.query = ''

 $scope.load = ()->
   return if $scope.loading
   $scope.loading = true
   params = {page: $scope.page, search: $scope.query}
   $http.get(itemsUrl, params: params).success (data)->
      $scope.loading = false
      $scope.items = data

 $scope.next = ()->
   $scope.page += 1
   $scope.load()

 $scope.prev = ()->
   return if $scope.page == 0
   $scope.page -= 1
   $scope.load()

 $scope.search = ()->
   $scope.page = 0
   $scope.load()

 $scope.load()


window.ShowCnt = ($scope, $routeParams, $http, $location)->
  itemUrl = "#{$location.absUrl()}.json"
  $http.get(itemUrl).success (data)->
    $scope.item = data
