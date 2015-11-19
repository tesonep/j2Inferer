calculating type
possibleClasses: aContext
	| r |
	r := self minClassesInContext: aContext.
	^ r ifEmpty: [ 
		J2Type withClasses: 
			((self maxClassesInContext: aContext) collect:[:e | self inferer typeInfoFor: e ]) 
	]