angular.module 'HouseApp'
  .controller 'HomeCtrl', ($http, $scope, $location, Auth)->
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