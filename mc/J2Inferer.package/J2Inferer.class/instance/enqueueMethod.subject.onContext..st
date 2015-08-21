tasks operations
enqueueMethod: aMethod subject: subject onContext:context
	notifier enqueueMethod: aMethod.
	aMethod assert: [ aMethod isNotNil] description: 'aMethod can not be nil'.
	queue
		enqueue:
			(J2OpenMethodTask new
				method: aMethod;
				inferer: self;
				subject: subject;
				context: context;
				yourself)