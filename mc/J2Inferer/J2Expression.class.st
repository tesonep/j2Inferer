"
This is the abstract class that represents all the common behavior beetween subtyped expressions.
"
Class {
	#name : #J2Expression,
	#superclass : #Object,
	#instVars : [
		'supertypes',
		'messages',
		'container'
	],
	#category : 'J2Inferer-Variables'
}

{ #category : #'as yet unclassified' }
J2Expression class >> new [
	self error:'Use #newOnClass:'
]

{ #category : #'as yet unclassified' }
J2Expression class >> newOnClass: aClass [
	^ self basicNew 
		container: aClass;
		yourself.
	
]

{ #category : #'adding types' }
J2Expression >> addMessageSent: msg [
	messages ifNil:[messages := IdentitySet new].
	messages add: msg.

]

{ #category : #'adding types' }
J2Expression >> addSupertype: anotherVariable [.
	supertypes ifNil:[ supertypes := Set new].
	supertypes add: anotherVariable.

]

{ #category : #accessing }
J2Expression >> allSelectors: aContext [
	^ self allSelectors: IdentitySet new onContext: aContext.
]

{ #category : #accessing }
J2Expression >> allSelectors: alreadyEvaluated onContext: aContext [
	(alreadyEvaluated includes: self)
		ifTrue: [ ^ #() ].
	alreadyEvaluated add: self.
	^ (self supertypes flatCollect: [ :e | e allSelectors: alreadyEvaluated onContext: aContext ]) , self selectors
]

{ #category : #blocks }
J2Expression >> blocksOn: aContext [
	^ self blocksOn: aContext alreadyEvaluated: IdentitySet new.
]

{ #category : #blocks }
J2Expression >> blocksOn: aContext alreadyEvaluated: alreadyEvaluated [
	^ #().
]

{ #category : #accessing }
J2Expression >> classTypeInfo [
	^ self container
]

{ #category : #accessing }
J2Expression >> container [
	^ container
]

{ #category : #accessing }
J2Expression >> container: anObject [
	container := anObject
]

{ #category : #accessing }
J2Expression >> elements [
	^ J2Variable empty
		yourself
]

{ #category : #accessing }
J2Expression >> filter: aType byMessages: messageSet [
	^ aType filter: messageSet.
]

{ #category : #accessing }
J2Expression >> inferer [
	^ J2Inferer instance
]

{ #category : #blocks }
J2Expression >> isBlockOn: aContext [
	^ self isBlockOn: aContext alreadyEvaluated: IdentitySet new.
]

{ #category : #blocks }
J2Expression >> isBlockOn: aContext alreadyEvaluated: alreadyEvaluated [
	^ false.
]

{ #category : #'calculating type' }
J2Expression >> maxClassesInContext: aContext [
   | allSelectors |
   allSelectors := self allSelectors: aContext.
	^ allSelectors 
		ifEmpty: #()
		ifNotEmpty: [ 
			self inferer implementorsRegistry implementorsOfAll: allSelectors.
		]
]

{ #category : #'adding types' }
J2Expression >> messages [
	^ messages ifNil:[IdentitySet new].
]

{ #category : #'calculating type' }
J2Expression >> minClasses [
	^ self minClassesInContext: self inferer context alreadyEvaluated: Dictionary new.

]

{ #category : #'calculating type' }
J2Expression >> minClassesInContext: aContext [
	^ self minClassesInContext: aContext alreadyEvaluated: Dictionary new.

]

{ #category : #'calculating type' }
J2Expression >> minClassesInContext: aContext alreadyEvaluated: alreadyEvaluated [
	| singleImplementor r |
	(alreadyEvaluated includesKey: {self. aContext contents})
		ifTrue: [ 
			^ alreadyEvaluated at:{self. aContext contents}
		].
	alreadyEvaluated at: {self. aContext contents} put:(J2Type empty).
	r := self filter: (self generateMinClassesInContext: aContext alreadyEvaluated: alreadyEvaluated) byMessages: self selectors .
	
	(self inferer config singleImplementorEnabled and:[ r isEmpty ]) ifTrue: [ 
		singleImplementor := self inferer singleImplementorOf: self selectors.
		singleImplementor ifNotNil:[
			r := singleImplementor collect:[:e | self inferer typeInfoFor: e].	
		]	
	].
	
	alreadyEvaluated at: {self. aContext contents} put:r.
	
	^r
]

{ #category : #'calculating type' }
J2Expression >> possibleClasses [

	^ self possibleClassesInContext: self inferer context

]

{ #category : #'calculating type' }
J2Expression >> possibleClassesInContext: aContext [
	| r |
	r := self minClassesInContext: aContext.
	r ifEmpty: [ 
		^ J2Type withClasses: 
			((self maxClassesInContext: aContext) collect:[:e | self inferer typeInfoFor: e ]) 
	].

	^ r
]

{ #category : #accessing }
J2Expression >> selectors [
	^ self messages collect:#selector.
]

{ #category : #accessing }
J2Expression >> supertypes [
	^ supertypes ifNil:[Set new].
]
