"
It Represents the array variable. Can have elements in it containment.
"
Class {
	#name : #J2Array,
	#superclass : #J2Expression,
	#instVars : [
		'elements'
	],
	#category : 'J2Inferer-Variables'
}

{ #category : #accessing }
J2Array >> addElement: anotherVariable [
	self elements addSubtype: anotherVariable
]

{ #category : #accessing }
J2Array >> addElements: elementsToAdd [
	elementsToAdd do:[ :e | self addElement:e].
]

{ #category : #accessing }
J2Array >> elements [
	^ elements
		ifNil:
			[ elements := (J2Variable newOnClass: self classTypeInfo)
				variableName: 'elements';
				yourself ]
]

{ #category : #accessing }
J2Array >> generateMinClassesInContext: aContext alreadyEvaluated: alreadyEvaluated [
	^J2Type withClass:(self inferer typeInfoFor: Array)
]

{ #category : #accessing }
J2Array >> printOn: aStream [
	aStream
		nextPutAll: 'a J2Array (';
		nextPutAll: elements printString; 
		nextPut: $)
]
