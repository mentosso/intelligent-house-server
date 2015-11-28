angular.module('HouseApp').factory 'Notification', ($http) ->
  dashboard: () ->
    $http.get('/notification/index.json')
