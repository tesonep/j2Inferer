tests
testContentsType
	| classInfo  metaClassInfo  classesToInfer|
	
	classesToInfer := {Bag. Dictionary}.
	classesToInfer := classesToInfer , (classesToInfer flatCollect:#allSuperclasses).
	classesToInfer := (classesToInfer , (classesToInfer collect:#class)) asSet.
	
	self inferClasses: classesToInfer.
	
	metaClassInfo := self infoOfClass: Bag class.
	classInfo := self infoOfClass: Bag.
	
	self assert: (metaClassInfo returnOfMethod: Bag class >> #contentsClass ) hasType: { Dictionary class } onContext: { metaClassInfo }.
	self assert: (classInfo instanceVariable: #contents) hasType: {Dictionary} onContext:{classInfo}