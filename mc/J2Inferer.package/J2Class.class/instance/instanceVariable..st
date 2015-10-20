accessing
instanceVariable: aName
	^ self instanceVariables 
		at: aName asSymbol 
		ifAbsent:[ 
			superclass 
				ifNil:[ self error: 'Undefined instance variable:', aName]
				ifNotNil: [ superclass instanceVariable: aName ]
		]