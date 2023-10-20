Class {
	#name : #IBModel,
	#superclass : #Object,
	#instVars : [
		'inferer',
		'element',
		'context'
	],
	#category : 'InfererBrowser'
}

{ #category : #'instance creation' }
IBModel class >> for: anElement [
	^ self new for:anElement using:anElement inferer;
		yourself.
]

{ #category : #'instance creation' }
IBModel class >> for: anElement on: aContext [
	^ self new for:anElement using:anElement inferer context:aContext;
		yourself.
]

{ #category : #'instance creation' }
IBModel class >> for: anElement using:inferer [
	^ self new for:anElement using:inferer;
		yourself.
]

{ #category : #accessing }
IBModel >> buildView: builder [
]

{ #category : #accessing }
IBModel >> element [
	^ element
]

{ #category : #initialization }
IBModel >> for: anElement using: anInferer [
	element := anElement.
	inferer := anInferer.
]

{ #category : #initialization }
IBModel >> for: anElement using: anInferer context: aContext [
	element := anElement.
	inferer := anInferer.
	context := aContext
]

{ #category : #accessing }
IBModel >> inferer [
	^ inferer
]
