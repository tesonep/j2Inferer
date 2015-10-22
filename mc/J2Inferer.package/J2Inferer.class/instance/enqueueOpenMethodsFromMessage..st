tasks operations
enqueueOpenMethodsFromMessage: aMessage
	queue
		enqueue:
			(J2OpenMethodFromMessage new
				message: aMessage;
				fillTask;
				yourself)