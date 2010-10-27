class TestCase
	constructor: (@name) ->
		@name ?= 'runTest'
		unless this.hasMethod(@name)
			console.error('Error: No test named ' + @name)
	setup: ->
		
	teardown: ->

	run: ->
		if this[@name]? 
			this[@name]()

	hasMethod: (testName) ->
		testName in this.getMethods()
	
	getTests: (testPrefix)->
		r = new RegExp()
		r.compile( testPrefix + '.*')
		return method for all method in this.getMethods() when r.test(method)
		
	getMethods: ->
		name for all name, object of this when typeof(object) is 'function'