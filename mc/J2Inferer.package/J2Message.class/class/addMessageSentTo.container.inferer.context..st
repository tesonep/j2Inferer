as yet unclassified
addMessageSentTo: aMessageNode container: aContainer inferer: inferer context:aContext
	| rcvr msg |
	rcvr := aContainer atExpression: aMessageNode receiver.
	msg := self
		addMessageSentTo: rcvr
		selector: aMessageNode selector
		parameters: (aMessageNode arguments collect: [ :e | aContainer atExpression: e ])
		inferer: inferer
		container: aContainer
		context: aContext.
	aContainer atExpression: aMessageNode put: msg