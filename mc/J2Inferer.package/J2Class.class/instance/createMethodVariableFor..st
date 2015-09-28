methods
createMethodVariableFor: aMethod
	inferer enqueueAllMethodsUpdated.
	^ aMethod methodClass = self analysedClass
		ifTrue:
			[ 
			J2Method new
				inferer: inferer;
				selector: aMethod selector;
				classTypeInfo: self;
				fillReturn;
				fillParameters:aMethod ast;
				yourself ]
		ifFalse: [ self createInheritedMethodVariableFor:aMethod ]