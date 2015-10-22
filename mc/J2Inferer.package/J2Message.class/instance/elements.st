accessing
elements
	^ J2Variable
		unionAll: (self methods collect: [ :m | m returnType elements ])
		name: 'elements'
		container: self
		inferer: self inferer