angular.module('HouseApp').factory 'Notification', ['$http', ($http) ->
  dashboard: () ->
    $http.get('/notification/index.json')
]
