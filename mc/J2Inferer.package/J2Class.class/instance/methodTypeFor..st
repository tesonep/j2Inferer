methods
methodTypeFor: aMethod
	^ self methods at: aMethod selector ifAbsent: [ self createMethodVariableFor: aMethod ]