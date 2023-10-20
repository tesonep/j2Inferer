"
Testing if nested blocks and contexts are handled properly.
"
Class {
	#name : #J2NestedContextTestClass,
	#superclass : #Object,
	#category : 'J2Inferer-Tests-TestCode-Contexts'
}

{ #category : #'test code' }
J2NestedContextTestClass >> nestedBlocksContext [
	| aVariable |
	aVariable := 3.
	aVariable 
		ifNil:[ aVariable := 27]
		ifNotNil:[
			(aVariable > 5) 
				ifTrue:[
					| anotherVariable|
					anotherVariable := aVariable * 25. 
					^ anotherVariable 
				] ifFalse: [ ^ aVariable:= 5 ]
		]
]

{ #category : #'test code' }
J2NestedContextTestClass >> nestedBlocksContextParameters: aParameter [
	aParameter 
		ifNil:[ ^ aParameter + 27]
		ifNotNil:[
			(aParameter > 5) 
				ifTrue:[
					^ aParameter * 25
				] ifFalse: [ ^ 5 ]
		]
]
