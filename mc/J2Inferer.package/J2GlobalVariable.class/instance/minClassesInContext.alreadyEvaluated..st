as yet unclassified
minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated
	| value |
	value := Smalltalk globals at: self name ifAbsent: [ ^ #() ].
	^ value
		ifNotNil: [ J2Type withClass: (self inferer typeInfoFor: value class) ]
		ifNil: [ #() ]