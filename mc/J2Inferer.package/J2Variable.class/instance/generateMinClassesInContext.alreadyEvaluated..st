accessing
generateMinClassesInContext: aContext alreadyEvaluated: alreadyEvaluated
	| type |
	type := J2Type empty.
	self subtypes do: [ :e | type union:(e minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated) ].
	^ type