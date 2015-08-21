as yet unclassified
testDetectingABag
	| classInfo varInfo |
	classInfo := self inferClass: J2AClassWithACollection.
	varInfo := classInfo variableFor: #aBag.
	self assert: varInfo hasMessages: #(#detect: #add:).
	self assert: varInfo hasType: {Bag}