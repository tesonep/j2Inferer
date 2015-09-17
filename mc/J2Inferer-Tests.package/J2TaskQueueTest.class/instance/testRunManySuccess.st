tests
testRunManySuccess.
	self taskQueue enqueue: (J2DummyTask successOn:self).
	self taskQueue enqueue: (J2DummyTask successOn:self).
	self taskQueue enqueue: (J2DummyTask successOn:self).	
	self taskQueue runAndWait.
	
	self assert: numberOfSuccess = 3.
	self assert: numberOfFailures = 0.
	self assert: numberOfErrorHandled = 0.	