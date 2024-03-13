"
Enqueue, if needed, the related methods to a message. 
In this way all the methods should be updated.
"
Class {
	#name : #J2OpenMethodFromMessage,
	#superclass : #J2AbstractTask,
	#instVars : [
		'message',
		'receivers',
		'impls'
	],
	#category : 'J2Inferer-Tasks'
}

{ #category : #comparing }
J2OpenMethodFromMessage >> = anotherTask [
	^ anotherTask compareToOpenMethodFromMessage: self
]

{ #category : #comparing }
J2OpenMethodFromMessage >> compareToOpenMethodFromMessage: anotherTask [
	^ message = anotherTask message
]

{ #category : #executing }
J2OpenMethodFromMessage >> execute [
	self inferer notifier openingMessage: self message.
	impls do: [ :e | self inferer enqueueMethod: e ]
]

{ #category : #accessing }
J2OpenMethodFromMessage >> fillTask [
	impls := (self inferer implementorsOf: message selector) select: [ :e | e methodClass isClass ]	"Only I care about the classes implementing the method, not the traits. "
]

{ #category : #comparing }
J2OpenMethodFromMessage >> hash [
	^ message hash
]

{ #category : #comparing }
J2OpenMethodFromMessage >> mergeWith: anotherTask [
	"Nothing to do :("
]

{ #category : #accessing }
J2OpenMethodFromMessage >> message [
	^ message
]

{ #category : #accessing }
J2OpenMethodFromMessage >> message: anObject [
	message := anObject

]

{ #category : #accessing }
J2OpenMethodFromMessage >> receivers [
	^ receivers
]

{ #category : #accessing }
J2OpenMethodFromMessage >> receivers: anObject [
	receivers := anObject
]

{ #category : #accessing }
J2OpenMethodFromMessage >> runLevel [
	^ 3.
]

{ #category : #accessing }
J2OpenMethodFromMessage >> shouldEnqueue [
	^ impls size <= (self inferer config maxNumberImplementorsToOpen)
]
