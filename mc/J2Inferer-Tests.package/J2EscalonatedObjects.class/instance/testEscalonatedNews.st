tests
testEscalonatedNews
	| objectA objectB |
	self inferClasses: {J2EscalonatedObjectsContainer. 
						J2EscalonatedObjectsContainerA.
						J2EscalonatedObjectsContainerB.}.

	self inferMethod: Behavior >> #new.
	self inferMethod: ProtoObject >> #initialize.
	self inferMethod: ProtoObject >> #ifNil:.
	
	objectA := inferer methodVariableFor: J2EscalonatedObjectsContainer >> #objectA.
	objectB := inferer methodVariableFor: J2EscalonatedObjectsContainer >> #objectB.
	
	self assert: objectA returnValue hasType: { J2EscalonatedObjectsContainerA } onContext: (self contextFor:{J2EscalonatedObjectsContainer}).
	self assert: objectB returnValue hasType: { J2EscalonatedObjectsContainerB } onContext: (self contextFor:{J2EscalonatedObjectsContainer}).
	