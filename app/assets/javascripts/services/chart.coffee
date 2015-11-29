angular.module('HouseApp').factory 'Chart', ['$http', ($http) ->
  humid_chart: () ->
    $http.get('/home/humid_chart.json')
  temp_chart: () ->
    $http.get('home/temp_chart.json')
]