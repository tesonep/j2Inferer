visiting
visitSuperNode: aSuperNode
	^ self container
		atExpression: aSuperNode
		ifAbsentPut: [ 
			J2Super new
				container: self container element;
				inferer: inferer; yourself ]