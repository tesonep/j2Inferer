methods
createInheritedMethodVariableFor: aMethod
	| anotherClass realMethod |	
	anotherClass := inferer typeInfoFor: aMethod methodClass.
	
	self haltIf:[ self == anotherClass ].
	
	realMethod := anotherClass methodTypeFor: aMethod.
	^ J2InheritedMethod new
		classTypeInfo: self;
		realMethod: realMethod;
		yourself