visiting
visitSuperNode: aSuperNode
	^ self container
		atExpression: aSuperNode
		ifAbsentPut: [ inferer selfVariable ]