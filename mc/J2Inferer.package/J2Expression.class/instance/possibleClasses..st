accessing
possibleClasses: aContext
	| r |
	r := self minClassesInContext: aContext.
	^ r ifEmpty: [ self maxClasses ]