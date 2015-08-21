visiting
visitSelfNode: aSelfNode
	^ self container
		atExpression: aSelfNode
		ifAbsentPut: [ 
			J2Self new
				container: self container;
				inferer: inferer; yourself ]