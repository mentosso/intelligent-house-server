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

    $scope.labels = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    $scope.series = ['Sensor A', 'Sensor B']
    $scope.data = [
      [],
      []
    ]

    $scope.temp_chart = () ->
      Home.temp_chart().then((data) ->
        console.log(data.data)
        $scope.data = data.data
      )
    $scope.temp_chart()