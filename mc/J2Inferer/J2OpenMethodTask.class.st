"
Open a method. A method is processed if it's not updated.

Processing a method is opening the AST and creating the relationships.
"
Class {
	#name : #J2OpenMethodTask,
	#superclass : #J2AbstractTask,
	#instVars : [
		'method',
		'methodVariable'
	],
	#category : #'J2Inferer-Tasks'
}

{ #category : #comparing }
J2OpenMethodTask >> = anotherTask [
	^ anotherTask compareToOpenMethodTask:self.
]

{ #category : #comparing }
J2OpenMethodTask >> compareToOpenMethodTask: anotherTask [
	^ method == anotherTask method	"I'm using identity because two methods can be the same if they have the same bytecode. It doesn't matter the selector or the hosting class"
]

{ #category : #executing }
J2OpenMethodTask >> execute [
	self methodVariable updateIfNeeded.

]

{ #category : #comparing }
J2OpenMethodTask >> hash [
	^ method hash.
]

{ #category : #comparing }
J2OpenMethodTask >> mergeWith: anotherTask [
	"Nothing to merge"
]

{ #category : #accessing }
J2OpenMethodTask >> method [
	^ method
]

{ #category : #accessing }
J2OpenMethodTask >> method: anObject [

	method := anObject
]

{ #category : #accessing }
J2OpenMethodTask >> methodVariable [
	^ methodVariable ifNil: [ methodVariable := self inferer methodVariableFor: method ]
]

{ #category : #printing }
J2OpenMethodTask >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: method name;
		nextPut: $)
]

{ #category : #accessing }
J2OpenMethodTask >> runLevel [
	^ 1.
]

{ #category : #accessing }
J2OpenMethodTask >> shouldEnqueue [
	^ self methodVariable isUpdated not.
]
