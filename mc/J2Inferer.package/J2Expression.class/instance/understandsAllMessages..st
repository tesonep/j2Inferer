accessing
understandsAllMessages: c
	^ self selectorsOfMessages allSatisfy: [ :m | c canUnderstand: m ]