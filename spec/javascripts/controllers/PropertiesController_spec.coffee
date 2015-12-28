describe "PropertiesController", ->
  scope        = null
  ctrl         = null
  location     = null
  routeParams  = null
  resource     = null
  httpBackend  = null

  setupController = (keywords,results)->
    inject(($location, $routeParams, $rootScope, $resource, $httpBackend, $controller)->
      scope       = $rootScope.$new()
      location    = $location
      resource    = $resource
      routeParams = $routeParams
      routeParams.keywords = keywords

      # capture the injected service
      httpBackend = $httpBackend 

      if results
        request = new RegExp("\/properties.*keywords=#{keywords}")
        httpBackend.expectGET(request).respond(results)

      ctrl = $controller('PropertiesController',
                         $scope: scope
                         $location: location)
    )
  beforeEach(module("pms"))
  beforeEach(setupController())

  afterEach ->
    httpBackend.verifyNoOutstandingExpectation()
    httpBackend.verifyNoOutstandingRequest()
    
  describe 'controller initialization', ->
    describe 'when no keywords present', ->
      beforeEach(setupController())
      it 'defaults to no properties', ->
        expect(scope.properties).toEqualData([])
      
      
  describe 'with keywords', ->
    keywords = 'foo'
    properties = [
      {
        id: 4
        name: 'Affordable Apardddtment'
      },
      {
        id: 2
        name: 'Great Apartment'
      }
    ]
    beforeEach ->
      setupController(keywords,properties)
      httpBackend.flush()

    it 'calls the back-end', ->
      expect(scope.properties).toEqualData(properties)    
      
      
  describe 'search()', ->
    beforeEach ->
      setupController()

    it 'redirects to itself with a keyword param', ->
      keywords = 'foo'
      scope.search(keywords)
      expect(location.path()).toBe('/')
      expect(location.search()).toEqualData({keywords: keywords})