angular.module('HouseApp').factory 'Sensor', ['$http', ($http) ->
  list: () ->
    $http.get('/sensors.json')

  create: (number, room_id) ->
    $http.post('/sensors.json', {number: number, room_id: room_id})
]
