tasks operations
openMethods: aMessage on: aContext
	| remainingContext |
	remainingContext := self
		remainingContextPredefinedMessage: aMessage
		onContext: aContext.
		
	remainingContext
		ifNotEmpty:
			[ 
			queue
				enqueue:
					(J2OpenMethodFromMessage new
						message: aMessage;
						inferer: self;
						context: remainingContext;
						fillTask;
						yourself) ]