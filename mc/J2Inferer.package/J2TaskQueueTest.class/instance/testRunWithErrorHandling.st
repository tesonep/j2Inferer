tests
testRunWithErrorHandling.
	self taskQueue enqueue: (J2DummyTask failsOn:self).
	self taskQueue enqueue: (J2DummyTask failsOn:self).
	self taskQueue enqueue: (J2DummyTask failsOn:self).	
	self taskQueue enqueue: (J2DummyTaskWithErrorHandler  successOn:self).
	self taskQueue enqueue: (J2DummyTask successOn:self).			
	self taskQueue enqueue: (J2DummyTaskWithErrorHandler  failsOn:self).
	self taskQueue enqueue: (J2DummyTaskWithErrorHandler  failsOn:self).
	self taskQueue enqueue: (J2DummyTaskWithErrorHandler  failsOn:self).
	self taskQueue runAndWait.
	
	self assert: numberOfSuccess = 2.
	self assert: numberOfFailures = 6.
	self assert: numberOfErrorHandled = 3.