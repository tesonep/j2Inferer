as yet unclassified
minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated
	| value |
	value := Smalltalk globals at: self name ifAbsent: [ ^ J2Type new ].
	^ value
		ifNotNil: [ J2Type withClass: (self inferer typeInfoFor: value class) ]
		ifNil: [ J2Type new ]