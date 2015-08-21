visiting
visitSuperNode: aSuperNode
	^ self container
		atExpression: aSuperNode
		ifAbsentPut: [ 
			J2Super new
				container: self container;
				inferer: inferer; yourself ]