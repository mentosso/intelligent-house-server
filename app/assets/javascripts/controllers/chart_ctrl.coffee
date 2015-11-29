angular.module 'HouseApp'
  .controller 'ChartCtrl', ['$http', '$scope', '$location', '$interval', 'Auth', 'Chart',
  ($http, $scope, $location, $interval, Auth, Chart)->
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

    $scope.temp_labels = []
    $scope.temp_series = []
    $scope.temp_data = [
      [],
      []
    ]

    $scope.options = {
      pointHitDetectionRadius : 5
    }

    $scope.temp_chart = () ->
      Chart.temp_chart().then((data) ->
        $scope.temp_data = data.data[0]
        $scope.temp_labels = data.data[1]
        $scope.temp_series = data.data[2]
      )
    $scope.temp_chart()


    $scope.humid_labels = []
    $scope.humid_series = []
    $scope.humid_data = [
      [],
      []
    ]

    $scope.humid_chart = () ->
      Chart.humid_chart().then((data) ->
        $scope.humid_data = data.data[0]
        $scope.humid_labels = data.data[1]
        $scope.humid_series = data.data[2]
      )
    $scope.humid_chart()

    $interval (->
      $scope.humid_chart()
      $scope.temp_chart()
    ).bind(this), 60000
  ]
