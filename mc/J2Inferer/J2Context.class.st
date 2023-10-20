"
This class represents a calling context in the inference process.
"
Class {
	#name : #J2Context,
	#superclass : #Object,
	#instVars : [
		'contents'
	],
	#category : 'J2Inferer'
}

{ #category : #'instance creation' }
J2Context class >> empty [
	^ self with: #().
]

{ #category : #'instance creation' }
J2Context class >> new [
	self error: 'use the other messages.'.
]

{ #category : #'instance creation' }
J2Context class >> with: contents [
	| cs | 
	cs := contents.
	contents ifNil:[self halt].
	
	(contents isKindOf: J2Type ) ifTrue:[ cs := contents minClasses ].
	^ self basicNew
		contents: cs;
		initialize;
		yourself
]

{ #category : #accessing }
J2Context >> contents [
	^ contents 
]

{ #category : #accessing }
J2Context >> contents: anObject [
	contents := anObject
]

{ #category : #'derived contexts' }
J2Context >> metaClassContext [
	^ self class with: (self contents collect:#metaClass)
]

{ #category : #printing }
J2Context >> printOn: aStream [
	super printOn: aStream.
	aStream nextPut: $(.
	contents ifNil: [ aStream nextPutAll: 'nil' ] ifNotNil: [ contents printOn: aStream ].
	aStream nextPut: $).
]

{ #category : #'derived contexts' }
J2Context >> superClassContext [
	^ self class with: (self contents collect:#superclass)
]
