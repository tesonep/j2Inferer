tasks operations
enqueueMethod: aMethod
	notifier enqueueMethod: aMethod.
	aMethod ifNil:[^self].
	queue
		enqueue:
			(J2OpenMethodTask new
				method: aMethod;
				inferer: self;
				yourself).
