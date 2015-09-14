accessing
buildRelationships
	| containerClass methodVariable |
	variable addSupertype: self.
	containerClass := self message containerClass analysedClass.
	
	((self message inferer implementorsOf: self message selector)
		select: [ :e | e methodClass isClass and:[ e methodClass = containerClass or:[ e methodClass allSuperclasses includes: containerClass] ]])
		do:
			[ :e | 
				methodVariable := self message inferer methodVariableFor: e.
				methodVariable parameters 
						ifEmpty: [[ self message inferer enqueueRelateMethod: methodVariable variableIndex: index parameterVariable: variable ] ]
						ifNotEmpty: [ (methodVariable parameters at: index) addSubtype: variable ]]
				