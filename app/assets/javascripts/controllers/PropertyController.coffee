controllers = angular.module('controllers')
controllers.controller("PropertyController", [ '$scope', '$routeParams', '$resource', '$location', 'flash',
  ($scope,$routeParams,$resource,$location, flash)->
  
    Property = $resource('/properties/:propertyId', { propertyId: "@id", format: 'json' },
      {
        'save':   {method:'PUT'},
        'create': {method:'POST'}
      }
    )
    
    if $routeParams.propertyId
      Property.get({propertyId: $routeParams.propertyId},
        ( (property)-> $scope.property = property ),
        ( (httpResponse)->
          $scope.property = null
          flash.error   = "There is no property with ID #{$routeParams.propertyId}"
        )
      )
    else
      $scope.property = {}
      
    $scope.back = -> $location.path("/")
      
    $scope.edit   = -> $location.path("/properties/#{$scope.property.id}/edit")
    
    $scope.cancel = ->
      if $scope.property.id
        $location.path("/properties/#{$scope.property.id}")
      else
        $location.path("/")

    $scope.save = ->
      onError = (_httpResponse)-> flash.error = "Something went wrong"
      if $scope.property.id
        $scope.property.$save(
          ( ()-> $location.path("/properties/#{$scope.property.id}/edit") ),
          onError
        )
      else
        Property.create($scope.property,
          ( (newProperty)-> $location.path("/properties/#{newProperty.id}/edit") ),
          onError
        )
    $scope.delete = () ->
      $scope.property.$delete()
      $scope.back()

])