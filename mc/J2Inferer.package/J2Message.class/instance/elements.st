accessing
elements
	^ J2Variable
		unionAll: (methods collect: [ :m | m returnType elements ])
		name: 'elements'
		container: self
		inferer: inferer