methods
createInheritedMethodVariableFor: aMethod
	| anotherClass realMethod |	
	self flag:'See if I have to remove. J2InheritedMethod also'.
	anotherClass := inferer typeInfoFor: aMethod methodClass.
	
	realMethod := anotherClass methodTypeFor: aMethod.
	^ J2InheritedMethod new
		classTypeInfo: self;
		realMethod: realMethod;
		yourself