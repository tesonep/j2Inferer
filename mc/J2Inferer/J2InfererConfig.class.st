"
These objects are the responsible to keep the configuration of the inferer.
"
Class {
	#name : #J2InfererConfig,
	#superclass : #Object,
	#instVars : [
		'maxNumberImplementorsToOpen',
		'maxNumberSubclassesToOpen',
		'singleImplementorEnabled'
	],
	#category : 'J2Inferer'
}

{ #category : #accessing }
J2InfererConfig >> initialize [
	maxNumberImplementorsToOpen := 1.
	maxNumberSubclassesToOpen := 20.
	singleImplementorEnabled := false.
]

{ #category : #accessing }
J2InfererConfig >> maxNumberImplementorsToOpen [
	^ maxNumberImplementorsToOpen
]

{ #category : #accessing }
J2InfererConfig >> maxNumberImplementorsToOpen: anObject [
	maxNumberImplementorsToOpen := anObject
]

{ #category : #accessing }
J2InfererConfig >> maxNumberSubclassesToOpen [
	^ maxNumberSubclassesToOpen
]

{ #category : #accessing }
J2InfererConfig >> maxNumberSubclassesToOpen: anObject [
	maxNumberSubclassesToOpen := anObject
]

{ #category : #accessing }
J2InfererConfig >> singleImplementorEnabled [
	^ singleImplementorEnabled
]

{ #category : #accessing }
J2InfererConfig >> singleImplementorEnabled: anObject [
	singleImplementorEnabled := anObject
]
