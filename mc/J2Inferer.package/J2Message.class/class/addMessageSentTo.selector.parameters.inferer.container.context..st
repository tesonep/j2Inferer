as yet unclassified
addMessageSentTo: receiver selector: selector parameters: parameters inferer: inferer container: container context:aContext
	| msg |
	msg := self new.
	msg receiver: receiver.
	msg selector: selector.
	msg inferer: inferer.
	msg container: container.
	msg parameters: (parameters withIndexCollect:[ :e :i | J2ParameterVariable newFor: e onMessage: msg index:i onContext:aContext]).
	msg parameters do:[ :e |	e buildRelationshipsOnContext:aContext.].
	receiver addMessageSent: msg.
	inferer openMethods: msg on:aContext.
	^ msg