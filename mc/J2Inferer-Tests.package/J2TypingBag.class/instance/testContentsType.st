tests
testContentsType
	| classInfo  |
	self skip.
	self inferClass: Bag class.
	classInfo := self inferClass: Bag.
	
	self assert: (classInfo instanceVariable: #contents) hasType: {Dictionary} onContext:{classInfo}..