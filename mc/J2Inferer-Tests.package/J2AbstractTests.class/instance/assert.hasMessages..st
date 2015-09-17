asserts
assert: typeVariable hasMessages: aBunchOfMsgs
	self assert: (typeVariable allSelectors includesAll: aBunchOfMsgs)
		  description: [ 'Should have included: ' , aBunchOfMsgs printString , ' but included: ', typeVariable allSelectors printString ]