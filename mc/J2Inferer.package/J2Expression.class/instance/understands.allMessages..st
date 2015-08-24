accessing
understands: c allMessages: aMessageSet
	^ (aMessageSet collect:#selector) allSatisfy: [ :m | c canUnderstand: m ]