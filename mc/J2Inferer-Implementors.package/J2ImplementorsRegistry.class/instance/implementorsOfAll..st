as yet unclassified
implementorsOfAll: bunchOfSelectors
	| bunch possible candidates |
	"Let's discard all the methods implemented in object, because everybody has them."
	bunchOfSelectors ifEmpty: [ ^#() ].
	bunch := (bunchOfSelectors difference:self knownObjectMessages) asArray.
	bunch ifEmpty: [ ^#() ].

	possible := self allUnderstanding: bunch first.
	possible ifEmpty: [ ^#() ].
	
	(2 to: bunch size) do:[:i |  
		candidates := self allUnderstanding: (bunch at:i).
		possible := possible intersection: candidates.			
		possible ifEmpty: [ ^#() ].	
	].	

	^ possible.
	