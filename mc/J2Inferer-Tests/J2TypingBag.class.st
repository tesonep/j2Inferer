Class {
	#name : #J2TypingBag,
	#superclass : #J2AbstractTests,
	#category : 'J2Inferer-Tests-Collections'
}

{ #category : #tests }
J2TypingBag >> testContentsType [
	| classInfo  metaClassInfo methodInfo  classesToInfer|
	
	classesToInfer := {Bag. Dictionary}.
	classesToInfer := classesToInfer , (classesToInfer flatCollect:#allSuperclasses).
	classesToInfer := (classesToInfer , (classesToInfer collect:#class)) asSet.
	
	self inferClasses: classesToInfer.
	
	metaClassInfo := self infoOfClass: Bag class.
	classInfo := self infoOfClass: Bag.
	
	methodInfo := metaClassInfo methodTypeFor: Bag class >> #contentsClass.
	
	self assert: methodInfo returnValue hasType: { Dictionary class } onContext: { metaClassInfo }.
	self assert: (classInfo instanceVariable: #contents) hasType: {Dictionary} onContext:{classInfo}
]
