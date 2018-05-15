accessing
buildRelationships: variable container: container
	| containerClass methodVariable |
	variable addSupertype: self.
	self expression: variable.
	
	containerClass := container containerClass analysedClass.
	
	(self message inferer implementorsOf: self message selector)
		select: [ :e | self class: containerClass isInHierarchyOf: e]
		thenDo:
			[ :e | 
				methodVariable := self message inferer methodVariableFor: e.
				methodVariable parameters 
						ifEmpty: [[ self message inferer enqueueRelateMethod: methodVariable variableIndex: index parameterVariable: variable ] ]
						ifNotEmpty: [ (methodVariable parameters at: index) addSubtype: (J2ParameterRelationship for:variable isMeta: containerClass isMeta) ]]
				