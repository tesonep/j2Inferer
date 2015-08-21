accessing
visitCascadeNode: aCascadeNode 
	aCascadeNode messages do: [:each | self visitNode: each].
	self container atExpression: aCascadeNode put: (self container atExpression:(aCascadeNode messages last))
	