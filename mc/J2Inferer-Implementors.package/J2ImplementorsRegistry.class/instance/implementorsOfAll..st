as yet unclassified
implementorsOfAll: bunchOfSelectors
	| bunch possible  first  candidates |
	"Let's discard all the methods implemented in object, because everybody has them."
	bunchOfSelectors ifEmpty: [ ^#() ].
	bunch := OrderedCollection new:(bunchOfSelectors size).
	bunchOfSelectors do:[:e |
			(self knownObjectMessages includes:e) ifFalse:[ bunch add:e].
		].
	
	bunch ifEmpty: [ ^#() ].
	first := bunch detectMin: [ :each | (self at:each) size ].

	possible := self allUnderstanding: first.
	possible ifEmpty: [ ^#() ].
	
	2 to: bunch size do:[:i |  
		candidates := self allUnderstanding: (bunch at:i).
		possible := possible intersection: candidates.			
		possible ifEmpty: [ ^#() ].	
	].	

	^ possible.
	