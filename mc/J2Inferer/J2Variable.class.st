"
Represents the information of a variable. 
A variable has a container and can returns its possible classes.

"
Class {
	#name : #J2Variable,
	#superclass : #J2Expression,
	#traits : 'TJ2IsBlock',
	#classTraits : 'TJ2IsBlock classTrait',
	#instVars : [
		'variableName',
		'subtypes'
	],
	#category : 'J2Inferer-Variables'
}

{ #category : #'as yet unclassified' }
J2Variable class >> emptyOnClass: aClass [
	^self newOnClass: aClass
]

{ #category : #'as yet unclassified' }
J2Variable class >> unionAll: anotherVariables name: aName container: aContainer inferer: inferer [
	| var |
	var := self emptyOnClass: aContainer.
	var variableName: aName.
	anotherVariables do: [ :e | var addSubtype: e ].
	^ var
]

{ #category : #'adding types' }
J2Variable >> addSubtype: anotherVariable [
	subtypes ifNil: [ subtypes := Set new ].
	subtypes add: anotherVariable.
	anotherVariable addSupertype: self.
]

{ #category : #blocks }
J2Variable >> doBlocksOn: aContext alreadyEvaluated: alreadyEvaluated [
	^ self subtypes
		flatCollect:
			[ :each | each blocksOn: aContext alreadyEvaluated: alreadyEvaluated ]
]

{ #category : #blocks }
J2Variable >> doIsBlockOn: aContext alreadyEvaluated: alreadyEvaluated [
	^ self subtypes
		anySatisfy:
			[ :each | each isBlockOn: aContext alreadyEvaluated: alreadyEvaluated ]
]

{ #category : #accessing }
J2Variable >> elements [
	^ J2Variable
		unionAll: (self subtypes collect: #elements)
		name: 'elements'
		container: self classTypeInfo
		inferer: self inferer
]

{ #category : #accessing }
J2Variable >> generateMinClassesInContext: aContext alreadyEvaluated: alreadyEvaluated [
	| type |
	type := J2Type empty.
	self subtypes do: [ :e | type union:(e minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated) ].
	^ type
]

{ #category : #queryng }
J2Variable >> hasNoSubtypes [
	^self subtypes isEmpty
]

{ #category : #accessing }
J2Variable >> name [
	^ variableName
]

{ #category : #printing }
J2Variable >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self name; 
		nextPut: $)
]

{ #category : #'adding types' }
J2Variable >> removeAllSubtypes [
	subtypes := nil.
]

{ #category : #accessing }
J2Variable >> subtypes [
	^ subtypes ifNil:[ Set new]
]

{ #category : #accessing }
J2Variable >> variableName [
	^ variableName
]

{ #category : #accessing }
J2Variable >> variableName: anObject [
	variableName := anObject
]
