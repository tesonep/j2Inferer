accessing
methodVariable
	^ methodVariable ifNil: [ methodVariable := self inferer methodVariableFor: method ]