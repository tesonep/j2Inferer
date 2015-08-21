accessing
visitThisContextNode: aThisContextNode
	^ self container atExpression: aThisContextNode ifAbsentPut: [ J2ThisContext new inferer:inferer;yourself]