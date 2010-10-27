class TestCase
	constructor: (@testName) ->
		
	setup: ->
		
	teardown: ->
		
	run: ->
		this[@testName]()
		

class t2 extends TestCase
	constructor:  ->
		super('testTest')
		
	testTest: ->
		console.log('testtest')
		

t = new t2()
t.run()