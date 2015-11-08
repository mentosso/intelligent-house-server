angular.module 'HouseApp'
  .controller 'UserCtrl', ($scope, $http, $location, User) ->
    User.checkUser().success (data) ->
      console.log(data)
      $location.path('/login') if data != true
        
    $scope.registerUser = (email, password, password_confirmation) ->
      User.registerUser(email, password, password_confirmation).success (data) ->
        console.log(data)
        $location.path('/home')

    $scope.loginUser = (email, password) ->
      User.loginUser(email, password).success (data) ->
        $location.path('/home')