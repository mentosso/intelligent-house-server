angular.module('HouseApp')
  .controller 'UserCtrl', ['$scope', '$http', '$location', 'User', 'Auth',
  ($scope, $http, $location, User, Auth) ->
    $scope.registerUser = (email, password, password_confirmation) ->
      User.registerUser(email, password, password_confirmation).success (data) ->
        $location.path('/home')
    $scope.loginUser = (email, password) ->
      credentials = {email: email, password: password}
      Auth.login(credentials, null).then((user) ->
        $location.path('/home')
      (error) ->
        # Authentication failed...
      )
  ]
