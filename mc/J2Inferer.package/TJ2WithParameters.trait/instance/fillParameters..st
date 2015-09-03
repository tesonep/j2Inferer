accessing
fillParameters: anAstNode
	anAstNode arguments do: [ :each | self addParameterFor: each name ]