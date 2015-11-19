accessing
filter: aMessageSet
	minClasses removeAllSuchThat: [ :c | (aMessageSet allSatisfy: [ :m | c canUnderstand: m ]) not ]