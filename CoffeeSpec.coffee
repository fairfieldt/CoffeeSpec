
root = exports ? this

describe = (testName, tests...) ->
	console.log('Testing ' + testName)
	
	setup = ->
	teardown = ->
	for test in tests
		foundSetup = false
		foundTeardown = false
		if test.name == 'setup'
			setup = test.run
			i = tests.indexOf(test)
			tests = tests[0...i].concat(tests[i+1..])
			foundSetup = true
			
		if test.name == 'teardown'
			teardown = test.run
			i = tests.indexOf(test)
			tests = tests[0...i].concat(tests[i+1..])
			foundTeardown = true
		if foundSetup and foundTeardown
			break
	
	for test in tests	
		for all i,j of test
			console.log(i + ' ' + j)
		console.log(test.name)
		test.run(setup, teardown)


it = (name, test) ->
	{name:name, run:(setup, teardown) -> 
		this.setup = setup
		this.setup()
		this.test = test
		this.test()
		this.teardown = teardown
		this.teardown()}
	
expect = (test) ->console.log(test)

beforeEach = (setup) -> {name:'setup', run:setup}

describe 'Node',

	beforeEach ->
		this.node = {x:2}
		
	it "should have x == 0", ->
		expect @node.x == 2
		expect @node.x == 12
	
toEqual = (a, b) -> a.toEqual(b)
expect = (x) -> {toEqual: (y) -> x == y}

console.log( expect(3).toEqual 3)
