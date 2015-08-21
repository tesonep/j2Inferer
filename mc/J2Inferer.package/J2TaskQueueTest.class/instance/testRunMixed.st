tests
testRunMixed.
	self taskQueue enqueue: (J2DummyTask failsOn:self).
	self taskQueue enqueue: (J2DummyTask failsOn:self).
	self taskQueue enqueue: (J2DummyTask failsOn:self).	
	self taskQueue enqueue: (J2DummyTask successOn:self).
	self taskQueue enqueue: (J2DummyTask successOn:self).			
	self taskQueue runAndWait.
	
	self assert: numberOfSuccess = 2.
	self assert: numberOfFailures = 3.
	self assert: numberOfErrorHandled = 0.