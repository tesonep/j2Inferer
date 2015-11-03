computing types
understands: c allSelectors: aMessageSet
	^ aMessageSet allSatisfy: [ :m | c canUnderstand: m ]