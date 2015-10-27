messages
addMessageSentTo: aMessage
	| rcvr msg |
	rcvr := self atExpression: aMessage receiver.
	msg := J2Message
		addMessageSent: aMessage
		container: self
		inferer: self inferer
		receiver: rcvr
		parameters: (aMessage arguments collect: [ :e | self atExpression: e ]).
	self atExpression: aMessage ifAbsentPut:  msg.