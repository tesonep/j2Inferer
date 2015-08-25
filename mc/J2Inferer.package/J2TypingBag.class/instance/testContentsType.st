as yet unclassified
testContentsType
	| classInfo  |
	self skip.	
	
	classInfo := self inferClass: Bag.
	self assert: (classInfo instanceVariable: #contents) hasType: {Dictionary}.