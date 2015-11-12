angular.module('HouseApp').factory 'Home', ($http) ->
  dashboard: () ->
    $http.get('/home/dashboard.json')
  temp_chart: () ->
    $http.get('home/temp_chart.json')