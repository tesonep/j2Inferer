asserts
assert: typeVariable hasMessages: aBunchOfMsgs
	self assert: (typeVariable selectorsOfAllMessages includesAll: aBunchOfMsgs)
		  description: [ 'Should have included: ' , aBunchOfMsgs printString , ' but included: ', typeVariable selectorsOfAllMessages printString ]