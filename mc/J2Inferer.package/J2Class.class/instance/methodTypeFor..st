methods
methodTypeFor: aMethod
	^ methods at: aMethod selector ifAbsentPut: [ self createMethodVariableFor: aMethod ]