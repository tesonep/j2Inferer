methods
methodTypeFor: aMethod
	^ methods at: aMethod ifAbsentPut: [ self createMethodVariableFor: aMethod ]