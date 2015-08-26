as yet unclassified
testDetectingABag
	| classInfo varInfo |
	self skip.
	
	classInfo := self inferClass: J2AClassWithACollection.
	varInfo := classInfo instanceVariable: #aBag.
	self assert: varInfo hasMessages: #(#detect: #add:).
	self assert: varInfo hasType: {Bag}