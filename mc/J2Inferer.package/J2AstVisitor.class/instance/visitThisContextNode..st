accessing
visitThisContextNode: aThisContextNode
	^ self container atExpression: aThisContextNode ifAbsentPut: [ inferer thisContextVariable]