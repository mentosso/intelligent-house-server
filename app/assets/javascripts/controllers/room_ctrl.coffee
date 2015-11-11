angular.module 'HouseApp'
  .controller 'RoomCtrl', ($http, $scope, $location, Auth, Room)->
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

    $scope.rooms = []
    $scope.list = () ->
      Room.list().then((rooms) ->
        $scope.rooms = rooms.data
      )
    $scope.list()

    $scope.create = (name, sqm) ->
      Room.create(name, sqm).then((room) ->
        $scope.list()
      (error) ->
        console.log('error')
      )