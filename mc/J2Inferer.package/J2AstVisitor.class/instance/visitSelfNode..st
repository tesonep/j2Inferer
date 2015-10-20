visiting
visitSelfNode: aSelfNode
	^ self container
		atExpression: aSelfNode
		ifAbsentPut: [ inferer selfVariable ]