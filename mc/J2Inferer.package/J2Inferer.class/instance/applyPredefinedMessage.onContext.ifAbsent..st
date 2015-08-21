tasks operations
applyPredefinedMessage: aMessage onContext:aContext ifAbsent: aValuable
	| msg |
	msg := predefinedMessages detect: [ :e | e canHandle: aMessage onContext:aContext ] ifFound:[
			:e | e applyTo: aMessage.
		] ifNone: aValuable.