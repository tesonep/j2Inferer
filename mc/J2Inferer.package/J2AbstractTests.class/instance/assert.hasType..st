asserts
assert: typeVariable hasType: aBunchOfClasses
	| possibleClasses ps |
	ps := typeVariable possibleClasses.
	
	self assertAllMethodsOpened.
	
	self
		assert: [ ps isNotNil ]
		description: 'The possible classes are all classes in the instalation'.

	possibleClasses := ps collect: #analysedClass.
	self
		assert: (possibleClasses includesAll: aBunchOfClasses)
		description:
			[ 
			'Possible classes should have:' , aBunchOfClasses asArray printString , ' but found:'
				, possibleClasses asArray printString ].
	self
		assert: (possibleClasses difference: aBunchOfClasses) isEmpty
		description:
			[ 
			'Possible classes should have:' , aBunchOfClasses asArray printString , ' but found:'
				, possibleClasses asArray printString ]