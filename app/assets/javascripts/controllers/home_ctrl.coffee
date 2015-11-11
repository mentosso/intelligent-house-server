angular.module 'HouseApp'
  .controller 'HomeCtrl', ($http, $scope, $location, Auth, Home)->
    Auth.currentUser().then((user) ->
      # User was logged in, or Devise returned
      # previously authenticated session.
      $scope.user = user
    (error) ->
      $location.path('/login')
    )

    $scope.logout = () ->
      Auth.logout().then((user) ->
        $location.path('/login')
      (error) ->
        console.log('error')
      )

    $scope.avg = []
    $scope.dashboard = () ->
      Home.dashboard().then((data) ->
        $scope.avg = data.data
      )
    $scope.dashboard()