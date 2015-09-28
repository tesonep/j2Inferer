methods
createInheritedMethodVariableFor: aMethod
	| anotherClass realMethod |	
	anotherClass := inferer typeInfoFor: aMethod methodClass.
	
	realMethod := anotherClass methodTypeFor: aMethod.
	^ J2InheritedMethod new
		classTypeInfo: self;
		realMethod: realMethod;
		yourself