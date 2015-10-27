visiting
visitSuperNode: aSuperNode
	^ self container
		atExpression: aSuperNode
		ifAbsentPut: [ self inferer selfVariable ]