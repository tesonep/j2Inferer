as yet unclassified
methodsForReceivingContext: aContext 
	| receiverContext |
	"Returns the methods for this message previously calculating the receiving context."
	receiverContext := self receivingContextOn:aContext.
	^self methodsOn: receiverContext .