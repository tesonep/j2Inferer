as yet unclassified
addMessageSentTo: receiver selector: selector parameters: parameters inferer: inferer container: container context:aContext
	| msg |
	msg := self new.
	msg receiver: receiver.
	msg selector: selector.
	msg parameters: parameters.
	msg inferer: inferer.
	msg container: container.
	receiver addMessageSent: msg.
	msg messageAdded:aContext.
	^ msg