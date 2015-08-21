accessing
checkMinClassesChange
	| newMinClasses |
	newMinClasses := self minClassesInContext: self defaultContext.
	(oldMinClasses isNil or: [ (newMinClasses difference: oldMinClasses) isNotEmpty ])
		ifTrue: [ self notifyChangedMinClasses. ]