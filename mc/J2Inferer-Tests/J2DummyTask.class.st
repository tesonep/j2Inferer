"
This is a Dummy task to be used in testing.
"
Class {
	#name : #J2DummyTask,
	#superclass : #Object,
	#instVars : [
		'shouldFail',
		'test'
	],
	#category : 'J2Inferer-Tests-Tasks'
}

{ #category : #'instance creation' }
J2DummyTask class >> failsOn:aTest [.
	^self new fails test:aTest.
]

{ #category : #'instance creation' }
J2DummyTask class >> successOn:aTest [.
	^self new success test:aTest.
]

{ #category : #accessing }
J2DummyTask >> execute [
	shouldFail
		ifTrue: [ 
			self test reportFailure.
			self error: 'I should fail :(' ]
		ifFalse: [ self test reportSuccess ]
]

{ #category : #'instance creation' }
J2DummyTask >> fails [.
	shouldFail := true.
]

{ #category : #initialization }
J2DummyTask >> initialize [
	super initialize.
	self success.
]

{ #category : #accessing }
J2DummyTask >> runLevel [
        ^ 2.
]

{ #category : #accessing }
J2DummyTask >> shouldEnqueue [
	^ true.
]

{ #category : #'instance creation' }
J2DummyTask >> success [.
	shouldFail := false.
]

{ #category : #accessing }
J2DummyTask >> test [
	^ test
]

{ #category : #accessing }
J2DummyTask >> test: anObject [
	test := anObject
]
