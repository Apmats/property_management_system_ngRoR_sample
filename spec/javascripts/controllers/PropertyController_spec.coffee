describe "PropertyController", ->
  scope        = null
  ctrl         = null
  routeParams  = null
  httpBackend  = null
  propertyId     = 10
  flash = null

  fakeProperty   =
    id: propertyId
    name: "Bad Apartment"
    description: "A pretty bad apartment"
    address: "Nonexistant Str. 45"
    property_type: "City"
    floor: 3
    

  setupController =(propertyExists=true)->
    inject(($location, $routeParams, $rootScope, $httpBackend, $controller, _flash_)->
      scope       = $rootScope.$new()
      location    = $location
      httpBackend = $httpBackend
      routeParams = $routeParams
      routeParams.propertyId = propertyId
      flash = _flash_
      
       
      request = new RegExp("\/properties/#{propertyId}")
      results = if propertyExists
        [200,fakeProperty]
      else
        [404]

      httpBackend.expectGET(request).respond(results[0],results[1])


      ctrl        = $controller('PropertyController',
                                $scope: scope)
    )




  beforeEach(module("pms"))

  afterEach ->
    httpBackend.verifyNoOutstandingExpectation()
    httpBackend.verifyNoOutstandingRequest()
    
    
  describe 'controller initialization', ->
    describe 'property is found', ->
      beforeEach(setupController())
      it 'loads the given property', ->
        httpBackend.flush()
        expect(scope.property).toEqualData(fakeProperty)
    describe 'property is not found', ->
      beforeEach(setupController(false))
      it 'loads the given property', ->
        httpBackend.flush()
        expect(scope.property).toBe(null)
        expect(flash.error).toBe("There is no property with ID #{propertyId}")