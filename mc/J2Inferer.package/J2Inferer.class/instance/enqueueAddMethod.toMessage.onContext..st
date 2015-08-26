tasks operations
enqueueAddMethod: aMethod toMessage:subject onContext:context
	queue
		enqueue:
			(J2AddMethodToMessage
				new
				method: aMethod;
				message: subject;
				inferer: self;
				context: context;
				yourself)
 