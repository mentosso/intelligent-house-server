angular.module 'HouseApp'
  .config ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider.otherwise('home')

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