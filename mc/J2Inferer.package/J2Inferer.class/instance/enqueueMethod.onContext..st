tasks operations
enqueueMethod: aMethod onContext:context
	notifier enqueueMethod: aMethod.
	aMethod assert: [ aMethod isNotNil ] description: 'aMethod can not be nil'.
	queue
		enqueue:
			(J2OpenMethodTask new
				method: aMethod;
				inferer: self;
				context: context;
				yourself).
