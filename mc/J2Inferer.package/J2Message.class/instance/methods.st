accessing
methods
	| receiverContext |
	receiverContext := self receivingContextOn: self defaultContext.
	^ self methodsOn: receiverContext