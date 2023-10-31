"
Represents the relationship of the receiver expression and the message sent. 
Including logic to resolve the receiver, the arguments of the message and the possible returntype.
"
Class {
	#name : #J2Message,
	#superclass : #J2Expression,
	#traits : 'TJ2IsBlock',
	#classTraits : 'TJ2IsBlock classTrait',
	#instVars : [
		'receiver',
		'selector',
		'parameters',
		'containerClass'
	],
	#category : #'J2Inferer-Variables'
}

{ #category : #'as yet unclassified' }
J2Message class >> addMessageSent: aMessageNode container: container inferer: inferer receiver: receiver parameters: parameters [
	| msg |
	msg := aMessageNode isSuperSend 
		ifTrue:[J2SuperMessage newOnClass: container containerClass] 
		ifFalse:[self newOnClass: container containerClass] .
		
	msg receiver: receiver.
	msg selector: aMessageNode selector.
	msg parameters: (parameters withIndexCollect:[ :e :i | J2ParameterVariable onMessage: msg index:i]) asArray.
	msg containerClass: container containerClass.
	
	parameters withIndexDo: [ :e :i | (msg parameters at:i) buildRelationships: e container: container ].
	receiver addMessageSent: msg.
	inferer enqueueOpenMethodsFromMessage: msg.
	^ msg
]

{ #category : #accessing }
J2Message >> addSupertype: anotherVariable [.
	"A message cannot have a supertype of another expression."
]

{ #category : #accessing }
J2Message >> containerClass [
	^ containerClass
]

{ #category : #accessing }
J2Message >> containerClass: anObject [
	containerClass := anObject
]

{ #category : #blocks }
J2Message >> doBlocksOn: aContext alreadyEvaluated: alreadyEvaluated [
	| methods |
	methods := self methodsForReceivingContext: aContext.
	^ methods
		flatCollect:
			[ :each | each returnValue blocksOn: aContext alreadyEvaluated: alreadyEvaluated ]
]

{ #category : #blocks }
J2Message >> doIsBlockOn: aContext alreadyEvaluated: alreadyEvaluated [
	| methods |
	methods := self methodsForReceivingContext: aContext.
	^ methods
		anySatisfy:
			[ :each | each returnValue isBlockOn: aContext alreadyEvaluated: alreadyEvaluated ]
]

{ #category : #accessing }
J2Message >> elements [
	^ J2Variable
		unionAll: (self methods collect: [ :m | m returnValue elements ])
		name: 'elements'
		container: self classTypeInfo 
		inferer: self inferer
]

{ #category : #accessing }
J2Message >> generateMinClassesInContext: aContext alreadyEvaluated: alreadyEvaluated [
	| receiverType remainingContext receiverContext resultType|
	receiverType := receiver minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated.
	receiverContext := J2Context with: receiverType minClasses.

	remainingContext := J2Context with: receiverType minClasses.

	resultType := J2Type empty.	

	self inferer predefinedMessages
		detect: [ :each | each canHandle: self onContext: receiverContext ]
		ifFound:
			[ :found | 
			remainingContext := found remainingContextFor: self onContext: receiverContext.
			resultType union: (found returnTypeFor: self onContext: receiverContext alreadyEvaluated: alreadyEvaluated) ].
	
		
	(self methodsOn: remainingContext)
			do: [ :e | resultType union:(e returnValue minClassesInContext: remainingContext alreadyEvaluated: alreadyEvaluated) ].

	^ resultType
]

{ #category : #'as yet unclassified' }
J2Message >> methodsForReceivingContext: aContext [ 
	| receiverContext |
	"Returns the methods for this message previously calculating the receiving context."
	receiverContext := self receivingContextOn:aContext.
	^self methodsOn: receiverContext .
]

{ #category : #accessing }
J2Message >> methodsOn: context [
	^ self inferer implementorsFor: self onContext: context
]

{ #category : #accessing }
J2Message >> parameters [
	^ parameters ifNil:[#()].
]

{ #category : #accessing }
J2Message >> parameters1 [
	^ parameters
]

{ #category : #accessing }
J2Message >> parameters: anObject [
	(anObject isNil or:[anObject isEmpty]) ifTrue:[parameters := nil].
	parameters := anObject
]

{ #category : #printing }
J2Message >> printOn: aStream [
	super printOn: aStream.
	aStream
		nextPut: $(;
		nextPutAll: self receiver printString;
		nextPutAll: ' ';
		nextPutAll: self selector printString;
		nextPut: $)
]

{ #category : #accessing }
J2Message >> receiver [
	^ receiver
]

{ #category : #accessing }
J2Message >> receiver: anObject [
	receiver := anObject.
]

{ #category : #accessing }
J2Message >> receivingContextOn: aContext [
	^ J2Context with: (receiver minClassesInContext: aContext)
]

{ #category : #accessing }
J2Message >> selector [
	^ selector
]

{ #category : #accessing }
J2Message >> selector: anObject [
	selector := anObject
]
