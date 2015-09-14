tasks operations
enqueueMethod: aMethod onContext:context
	notifier enqueueMethod: aMethod.
	aMethod ifNil:[^self].
	queue
		enqueue:
			(J2OpenMethodTask new
				method: aMethod;
				inferer: self;
				context: context;
				yourself).
