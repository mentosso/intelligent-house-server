angular.module 'HouseApp'
  .config ($stateProvider, $urlRouterProvider, User) ->
    $urlRouterProvider.otherwise('/home')

    $stateProvider
      .state('home', {
        url: '/home',
        controller: 'HomeCtrl',
        templateUrl: 'home.html'
        resolve:{
            User.checkUser().success (data) ->
              $location('/login') if data == true
        }
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