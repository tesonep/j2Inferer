accesing type variables
methodVariableFor: aMethod
	| aClass classTypeInfo  |
	aClass := aMethod methodClass.
	classTypeInfo := self typeInfoFor: aClass.
	^ classTypeInfo methodTypeFor: aMethod.