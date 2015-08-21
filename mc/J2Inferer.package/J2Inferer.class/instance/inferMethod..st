infering
inferMethod: aMethod
	self enqueueMethod: aMethod.
	self runAndWait.