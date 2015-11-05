tests
testEscalonatedNews
	| classInfo |
	self
		inferClasses:
			{J2EscalonatedObjectsContainer.
			J2EscalonatedObjectsContainerA.
			J2EscalonatedObjectsContainerB}.

	self inferMethod: Behavior >> #new.
	self inferMethod: ProtoObject >> #initialize.
	self inferMethod: ProtoObject >> #ifNil:.

	classInfo := self infoOfClass: J2EscalonatedObjectsContainer.

	self
		assert: (classInfo returnOfMethod: J2EscalonatedObjectsContainer >> #objectA)
		hasType: {J2EscalonatedObjectsContainerA}
		onContext: (self contextFor: {J2EscalonatedObjectsContainer}).
	self
		assert: (classInfo returnOfMethod: J2EscalonatedObjectsContainer >> #objectB)
		hasType: {J2EscalonatedObjectsContainerB}
		onContext: (self contextFor: {J2EscalonatedObjectsContainer})