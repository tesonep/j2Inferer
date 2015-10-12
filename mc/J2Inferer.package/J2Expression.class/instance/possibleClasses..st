accessing
possibleClasses: aContext
	| r |
	r := self minClassesInContext: aContext.
	^ r ifEmpty: [ (self maxClassesInContext: aContext) collect:[:e | inferer typeInfoFor: e ] ]