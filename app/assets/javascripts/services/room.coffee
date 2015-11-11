angular.module('HouseApp').factory 'Room', ($http) ->
  list: () ->
    $http.get('/rooms.json')

  create: (name, sqm) ->
    $http.post('/rooms.json', {name: name, sqm: sqm})