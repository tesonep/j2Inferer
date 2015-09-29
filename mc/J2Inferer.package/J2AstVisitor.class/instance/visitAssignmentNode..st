visiting
visitAssignmentNode: anAssignmentNode
	| variable |
	self visitNode: anAssignmentNode variable.
	self visitNode: anAssignmentNode value.
	variable := self container variableFor: anAssignmentNode variable.
	variable addSubtype: (self container atExpression: anAssignmentNode value).

	self container
		atExpression: anAssignmentNode
		ifAbsentPut:[
			J2AssignmentExpression new
				leftPart: variable;
				expression: anAssignmentNode infererSource;
				inferer: inferer;
				container: self container element;
				yourself]