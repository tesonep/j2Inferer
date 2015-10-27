visiting
visitSelfNode: aSelfNode
	^ self container
		atExpression: aSelfNode
		ifAbsentPut: [ self inferer selfVariable ]