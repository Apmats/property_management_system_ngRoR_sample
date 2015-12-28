controllers = angular.module('controllers')
controllers.controller("PropertiesController", [ '$scope', '$route', '$routeParams', '$location', '$resource', '$anchorScroll'
  ($scope, $route,$routeParams,$location,$resource,$anchorScroll)->
    
    Property = $resource('/properties/:propertyId', { propertyId: "@id", format: 'json' })
    
    if $routeParams.keywords
      Property.query(keywords: $routeParams.keywords, (results)-> $scope.properties = results)
    else if $routeParams.showAll
        Property.query((results)-> $scope.properties = results)
    else 
      $scope.properties = []    
    
    $scope.back = -> $location.path("/")
    
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)
    
    $scope.showAll = -> $location.path("/").search('keywords', null).search('showAll', true)     
       
    # removing for now, will be added back on when it's needed  
    # $scope.view = (propertyId)-> 
    #   $location.path("/properties/#{propertyId}")
      
    $scope.newProperty = -> $location.path("/properties/new")
    
    $scope.edit = (propertyId)-> $location.path("/properties/#{propertyId}/edit")
    
    $scope.delete = (property) ->
      property.$delete()
      $route.reload()
      
    $scope.goToSearch = ->
      $location.hash('searchPoint')
      $anchorScroll();  
])