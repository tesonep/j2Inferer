methods
createMethodVariableFor: aMethod
	^ aMethod methodClass = self analysedClass
		ifTrue:
			[ 
			J2Method new
				inferer: inferer;
				method: aMethod;
				classTypeInfo: self;
				fillReturn;
				fillParameters:aMethod ast;
				yourself ]
		ifFalse: [ self createInheritedMethodVariableFor:aMethod ]