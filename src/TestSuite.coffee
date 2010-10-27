class TestSuite
	constructor: ->
		@tests = []
		@suites = []

	addTest: (test) ->
		@tests.push(test)
		
	addSuite: (suite) ->
		@suites.push(suite)
		
	runTests: ->
		for test in @tests
			test.run()