angular.module('HouseApp').directive 'selectpicker', ['$timeout', ($timeout) ->
  {
    restrict: 'A'
    link: (scope, element, attributes) ->
      $timeout (->
        scope.$apply ->
          element.selectpicker(showSubtext: true)
        scope.$watch 'roomSelected', (newValue, old) ->
          console.log 'selected ', newValue
      ), 0
  }
]