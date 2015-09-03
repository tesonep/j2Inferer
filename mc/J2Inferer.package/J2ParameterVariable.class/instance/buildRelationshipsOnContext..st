accessing
buildRelationshipsOnContext: aContext
	variable addSupertype: self.
	((self message methodsForReceivingContext: aContext)
		select: [ :e | (e isKindOf: J2AbstractPredefinedMethod) not ])
		do:
			[ :e | 
			(e classTypeInfo selfAndSuperclasses includes: self message containerClass)
				ifTrue:
					[ 
						e parameters 
							ifEmpty: [[ self message inferer enqueueRelateMethod: e variableIndex: index parameterVariable: variable ] ]
							ifNotEmpty: [ (e parameters at: index) addSubtype: variable ]]
					]