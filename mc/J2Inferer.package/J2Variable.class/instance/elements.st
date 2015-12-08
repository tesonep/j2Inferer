accessing
elements
	^ J2Variable
		unionAll: (self subtypes collect: #elements)
		name: 'elements'
		container: self classTypeInfo
		inferer: self inferer