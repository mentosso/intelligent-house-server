angular.module('HouseApp').factory 'User', ($http) ->
  registerUser: (email, password, password_confirmation) ->
    usr_hash = {user: {email: email, password: password, password_confirmation: password_confirmation}}
    $http.post('/users.json', usr_hash)

  loginUser: (email, password) ->
    $http.post('/users/sign_in', {user: {email: email, password: password}})