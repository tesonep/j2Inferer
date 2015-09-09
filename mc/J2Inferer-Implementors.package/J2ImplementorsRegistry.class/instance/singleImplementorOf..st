as yet unclassified
singleImplementorOf: bunchOfSelectors
	| possibleMethods possibleClass |
	"A more simple implementation"
	
	bunchOfSelectors ifEmpty:[^nil].

	possibleMethods := (self at:bunchOfSelectors anyOne) methods.
	(possibleMethods size ~= 1) ifTrue:[^nil].

	possibleClass := possibleMethods anyOne methodClass.	
	^possibleClass subclasses ifEmpty: [{possibleClass }] ifNotEmpty:[nil].