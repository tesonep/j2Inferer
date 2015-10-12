accessing
methods: aContextForReceiver
	| receiverContext |
	receiverContext := self receivingContextOn: aContextForReceiver.
	^ self methodsOn: receiverContext