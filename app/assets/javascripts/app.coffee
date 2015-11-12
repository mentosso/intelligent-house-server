IntelHouse = angular.module('HouseApp', ['ui.router', 'templates', 'Devise', 'chart.js'])


IntelHouse.config ($provide, $httpProvider) ->
    # CSFR token
    $httpProvider.defaults.headers.common['X-CSRF-Token'] =
      angular.element(document.querySelector('meta[name=csrf-token]'))
        .attr('content')