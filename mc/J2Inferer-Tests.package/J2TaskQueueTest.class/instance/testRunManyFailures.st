tests
testRunManyFailures
	self taskQueue enqueue: (J2DummyTask failsOn: self).
	self taskQueue enqueue: (J2DummyTask failsOn: self).
	self taskQueue enqueue: (J2DummyTask failsOn: self).
	
	self taskQueue runAndWait.
	
	self assert: numberOfSuccess = 0.
	self assert: numberOfFailures = 3.
	self assert: numberOfErrorHandled = 0