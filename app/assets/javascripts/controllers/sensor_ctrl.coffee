angular.module 'HouseApp'
  .controller 'SensorCtrl', ['$http', '$scope', '$location', 'Auth', 'Room', 'Sensor',
  ($http, $scope, $location, Auth, Room, Sensor)->
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
    $scope.roomSelected
    $scope.rooms = []
    $scope.listRooms = () ->
      Room.list().then((rooms) ->
        $scope.rooms = rooms.data
      )
    $scope.listRooms()

    $scope.sensors = []
    $scope.listSensors = () ->
      Sensor.list().then((sensors) ->
        $scope.sensors = sensors.data
      )
    $scope.listSensors()

    $scope.create = (number) ->
      Sensor.create(number, $scope.roomSelected.match(/\d+/)[0]).then((sensor) ->
        $scope.listSensors()
      (error) ->
        console.log('error')
      )
  ]