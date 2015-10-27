accessing
visitThisContextNode: aThisContextNode
	^ self container atExpression: aThisContextNode ifAbsentPut: [ self inferer thisContextVariable]