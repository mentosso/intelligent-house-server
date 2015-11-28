IntelHouse = angular.module('HouseApp', ['ui.router', 'templates',
  'Devise', 'chart.js', 'yaru22.angular-timeago'])


IntelHouse.config ($provide, $httpProvider) ->
    # CSFR token
    $httpProvider.defaults.headers.common['X-CSRF-Token'] =
      angular.element(document.querySelector('meta[name=csrf-token]'))
        .attr('content')