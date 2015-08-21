accessing
visitArrayNode: anArrayNode
	| elements |
	anArrayNode children do: [ :each | self visitNode: each ].
	self container
		atExpression: anArrayNode
		ifAbsentPut:
			[ 
			elements := anArrayNode children collect: [ :e | self container atExpression: e ].
			J2Array new
				expression: anArrayNode infererSource;
				container: self container;
				addElements: elements;
				inferer: inferer;
				yourself ]