as yet unclassified
minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated
	| value |
	value := Smalltalk globals at: self name ifAbsent:[^#()].
	^ value ifNotNil: [ {inferer typeInfoFor:value class} ] ifNil: [ #() ]