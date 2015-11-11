angular.module('HouseApp').factory 'Home', ($http) ->
  dashboard: () ->
    $http.get('/home/dashboard.json')