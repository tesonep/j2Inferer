methods
methodTypeFor: aMethod
	^ methods at: aMethod selector ifAbsent: [ self createMethodVariableFor: aMethod ]