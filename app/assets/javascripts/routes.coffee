angular.module 'HouseApp'
  .config ['$stateProvider', '$urlRouterProvider',
  ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.otherwise('/home')

    $stateProvider
      .state('home', {
        url: '/home',
        controller: 'HomeCtrl',
        templateUrl: 'home.html'
      })
      .state('login', {
        url: '/login',
        controller: 'UserCtrl',
        templateUrl: 'login.html'
      })
      .state('sign_up', {
        url: '/sign_up',
        controller: 'UserCtrl',
        templateUrl: 'signup.html'
      })
      .state('room', {
        url: '/room',
        controller: 'RoomCtrl',
        templateUrl: 'room.html'
      })
      .state('sensor', {
        url: '/sensor',
        controller: 'SensorCtrl',
        templateUrl: 'sensor.html'
      })
      .state('temp_chart', {
        url: '/temp_chart',
        controller: 'ChartCtrl',
        templateUrl: 'temp_chart.html'
      })
      .state('humid_chart', {
        url: '/humid_chart',
        controller: 'ChartCtrl',
        templateUrl: 'humid_chart.html'
      })
]