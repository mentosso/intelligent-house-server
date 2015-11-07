angular.module 'HouseApp'
  .controller 'UserCtrl', ($scope, $http, $location, Users) ->
    $scope.registerUser = (email, password, password_confirmation) ->
      Users.registerUser(email, password, password_confirmation).success (data) ->
        console.log(data)
        $location.path('/home')