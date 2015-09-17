tests
testRunAllOnEmptyQueue
	self taskQueue runAndWait.
	self assert: numberOfSuccess = 0.
	self assert: numberOfFailures = 0.
	self assert: numberOfErrorHandled = 0.