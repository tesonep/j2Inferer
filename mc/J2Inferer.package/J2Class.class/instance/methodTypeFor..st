methods
methodTypeFor: aMethod
	^ methods at: aMethod name ifAbsentPut: [ self createMethodVariableFor: aMethod ]