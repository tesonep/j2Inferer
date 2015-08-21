as yet unclassified
generateMinClassesInContext: aContext alreadyEvaluated: alreadyEvaluated
	"	| value |
	value := Smalltalk globals at: self name.
	^ (value ifNotNil: [ {value class} ] ifNil: [ #() ])
		, (super generateMinClassesInContext: aContext)"

	| value |
	value := Smalltalk globals at: self name ifAbsent:[^#()].
	^ value ifNotNil: [ {inferer typeInfoFor:value class} ] ifNil: [ #() ]