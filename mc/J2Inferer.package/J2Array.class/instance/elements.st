accessing
elements
	^ elements
		ifNil:
			[ elements := (J2Variable newOnClass: self classTypeInfo)
				variableName: 'elements';
				yourself ]