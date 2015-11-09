accessing
relateParametersToSelf
	self parameters doWithIndex: [
		:e :parameterIndex | e addSubtype: (J2BlockParameter for: self index: parameterIndex)
	]