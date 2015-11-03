computing types
possibleClasses: aContext
	| r |
	r := self minClassesInContext: aContext.
	^ r ifEmpty: [ self maxClassesInContext: aContext ]