#= require TestCase
#= require TestSuite

CoffeeUnit = 

	runTestSuite: (testSuite) ->
		testSuite.runTests()
		for suite in testSuite.suites
			suit.runTests()
			
	makeTestSuite: (testCase, prefix) ->
		suite = new TestSuite()
		testCase1 = new testCase()
		
		testNames = testCase1.getTests(prefix)
		
		if testNames.length == 0
			suite.addTest(testCase1)
		else
			for name in testNames
				nextTest = new testCase(name)
				suite.addTest(nextTest)
				
		return suite
			
			
			
assert = (test, message) ->
	console.log(message)
	unless test is true
		console.error('Fail: ' + message)
	return test