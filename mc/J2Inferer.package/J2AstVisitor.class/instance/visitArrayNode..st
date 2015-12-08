accessing
visitArrayNode: anArrayNode
	| elements |
	anArrayNode children do: [ :each | self visitNode: each ].
	self container
		atExpression: anArrayNode
		ifAbsentPut:
			[ 
			elements := anArrayNode children collect: [ :e | self container atExpression: e ].
			(J2Array newOnClass: self container containerClass)
				addElements: elements;
				yourself ]