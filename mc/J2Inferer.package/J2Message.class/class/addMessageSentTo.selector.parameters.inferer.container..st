as yet unclassified
addMessageSentTo: receiver selector: selector parameters: parameters inferer: inferer container: container
	| msg |
	msg := self new.
	msg receiver: receiver.
	msg selector: selector.
	msg inferer: inferer.
	msg container: container.
	msg parameters: (parameters withIndexCollect:[ :e :i | J2ParameterVariable newFor: e onMessage: msg index:i]).
	msg parameters do:[ :e |	e buildRelationships.].
	receiver addMessageSent: msg.
	inferer openMethods: msg.
	^ msg