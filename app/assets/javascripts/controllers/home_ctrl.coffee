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

    $scope.labels = []
    $scope.series = []
    $scope.data = [
      [],
      []
    ]

    $scope.temp_chart = () ->
      Home.temp_chart().then((data) ->
        console.log(data.data)
        $scope.data = data.data[0]
        $scope.labels = data.data[1]
        $scope.series = data.data[2]
      )
    $scope.temp_chart()