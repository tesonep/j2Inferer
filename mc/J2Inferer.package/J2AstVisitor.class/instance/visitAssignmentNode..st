visiting
visitAssignmentNode: anAssignmentNode
	| variable |
	self visitNode: anAssignmentNode variable.
	self visitNode: anAssignmentNode value.
	variable := self container variableFor: anAssignmentNode variable.
	variable addSubtype: (self container atExpression: anAssignmentNode value).

	self container
		atExpression: anAssignmentNode
		ifAbsentPut:[ variable ]