asserts
assert: typeVariable hasMessages: aBunchOfMsgs onContext: context
	self assert: ((typeVariable allSelectors: context) includesAll: aBunchOfMsgs)
		  description: [ 'Should have included: ' , aBunchOfMsgs printString , ' but included: ', typeVariable allSelectors printString ]