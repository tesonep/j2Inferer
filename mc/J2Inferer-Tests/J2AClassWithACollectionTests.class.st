Class {
	#name : #J2AClassWithACollectionTests,
	#superclass : #J2AbstractTests,
	#category : 'J2Inferer-Tests-Collections'
}

{ #category : #tests }
J2AClassWithACollectionTests >> testDetectingABag [
	| classInfo varInfo |
	self inferClasses: { J2AClassWithACollection. J2AClassWithACollection class. Bag . Bag class. Behavior. ProtoObject }.
	
	classInfo := self infoOfClass: J2AClassWithACollection.
	varInfo := classInfo instanceVariable: #aBag.
	self assert: varInfo hasMessages: #(#detect: #add:) onContext: {classInfo}.
	self assert: varInfo hasType: {Bag} onContext: {classInfo}
]

{ #category : #tests }
J2AClassWithACollectionTests >> testDetectingContent [
	| classInfo varInfo methodInfo |
	self skip.
	self inferAllParentsAndMetas: { J2AClassWithACollection. Bag. J2UsingAClassWithACollection }.
	
	classInfo := self infoOfClass: J2UsingAClassWithACollection.
	varInfo := classInfo instanceVariable: #anObject.
	methodInfo := classInfo methodTypeFor:  J2UsingAClassWithACollection >> #any.
	
	self assert: varInfo hasType: {J2AClassWithACollection} onContext: {classInfo}.
	self assert: methodInfo returnValue hasType: {SmallInteger} onContext: {classInfo}
]
