accessing
elements
	^ J2Variable
		unionAll: (self methods collect: [ :m | m returnValue elements ])
		name: 'elements'
		container: self classTypeInfo 
		inferer: self inferer