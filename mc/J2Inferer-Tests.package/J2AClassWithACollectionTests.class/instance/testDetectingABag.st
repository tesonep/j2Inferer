tests
testDetectingABag
	| classInfo varInfo |
	self inferClasses: { J2AClassWithACollection. J2AClassWithACollection class. Bag . Bag class. Behavior. ProtoObject }.
	
	classInfo := self infoOfClass: J2AClassWithACollection.
	varInfo := classInfo instanceVariable: #aBag.
	self assert: varInfo hasMessages: #(#detect: #add:) onContext: {classInfo}.
	self assert: varInfo hasType: {Bag} onContext: {classInfo}