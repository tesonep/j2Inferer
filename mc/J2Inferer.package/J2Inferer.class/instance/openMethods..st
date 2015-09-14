tasks operations
openMethods: aMessage
	queue
		enqueue:
			(J2OpenMethodFromMessage new
				message: aMessage;
				inferer: self;
				fillTask;
				yourself)