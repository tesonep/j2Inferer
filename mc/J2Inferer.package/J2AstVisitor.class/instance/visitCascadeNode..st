accessing
visitCascadeNode: aCascadeNode 
	aCascadeNode messages do: [:each | self visitNode: each].
	self container atExpression: aCascadeNode ifAbsentPut: [self container atExpression:(aCascadeNode messages last)]
	