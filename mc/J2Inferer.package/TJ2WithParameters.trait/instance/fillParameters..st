accessing
fillParameters: anAstNode
	anAstNode arguments ifEmpty: [ ^self ].
	self parameters: (Array new:  anAstNode arguments size).
	anAstNode arguments doWithIndex: [ :each :index | self addParameterFor: each name at:index ]