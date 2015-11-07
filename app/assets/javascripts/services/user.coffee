angular.module('HouseApp').factory 'Users', ($http) ->
  registerUser: (email, password, password_confirmation) ->
    usr_hash = {user: {email: email, password: password, password_confirmation: password_confirmation}}
    $http.post('/users.json', usr_hash)

  loginUser: (email, password) ->
    $http.post('/users/sign_in', {challenge_id: challenge_id})

  currentUser: () ->
    $http.jsonp('/index.json')