tasks operations
openMethods: aMessage on:aContext
	self
		applyPredefinedMessage: aMessage onContext:aContext
		ifAbsent: [ 
			queue enqueue: 
			(J2OpenMethodFromMessage new
				message: aMessage;
				inferer: self;
				context: aContext;
				fillTask;
				yourself) ]