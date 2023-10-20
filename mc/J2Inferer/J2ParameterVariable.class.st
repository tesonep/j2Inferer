"
This variable represents the binding between an argument in the message and the actual parameter in the block or method.
It build a stronger relationship when the sender and the receiver are the same class or hierarchy.
"
Class {
	#name : #J2ParameterVariable,
	#superclass : #Object,
	#instVars : [
		'message',
		'index',
		'expression'
	],
	#category : 'J2Inferer-Variables'
}

{ #category : #'instance creation' }
J2ParameterVariable class >> onMessage: aMessage index:anIndex [
	| v |
	v := self new.
	v message: aMessage.
	v index:anIndex.
	^v
]

{ #category : #accessing }
J2ParameterVariable >> allSelectors: alreadyEvaluated onContext: context [
	| all |
	(alreadyEvaluated includes: self)
		ifTrue: [ ^ #() ].
	alreadyEvaluated add: self.

	all := Set new.
	(self message methodsForReceivingContext: context)
		do:
			[ :e | all addAll: ((e parameters at: index) allSelectors: alreadyEvaluated onContext: context) ].
	^ all
]

{ #category : #accessing }
J2ParameterVariable >> buildRelationships: variable container: container [
	| containerClass methodVariable |
	variable addSupertype: self.
	self expression: variable.
	
	containerClass := container containerClass analysedClass.
	
	(self message inferer implementorsOf: self message selector)
		select: [ :e | self class: containerClass isInHierarchyOf: e]
		thenDo:
			[ :e | 
				methodVariable := self message inferer methodVariableFor: e.
				methodVariable parameters 
						ifEmpty: [[ self message inferer enqueueRelateMethod: methodVariable variableIndex: index parameterVariable: variable ] ]
						ifNotEmpty: [ (methodVariable parameters at: index) addSubtype: (J2ParameterRelationship for:variable isMeta: containerClass isMeta) ]]
				
]

{ #category : #accessing }
J2ParameterVariable >> class: containerClass isInHierarchyOf: method [
	| methodClass methodMetaClass|
	methodClass := method methodClass.

	methodClass isClass ifFalse:[^false].
	methodClass = containerClass ifTrue:[^true].	

	methodMetaClass := method methodClass class.
	methodMetaClass = containerClass ifTrue:[^true].

	(containerClass withAllSuperclasses includes: methodClass) ifTrue:[^true].
	(containerClass withAllSuperclasses includes: methodMetaClass) ifTrue:[^true].
	
	^ false.
]

{ #category : #accessing }
J2ParameterVariable >> classTypeInfo [ 
	^ self expression classTypeInfo
]

{ #category : #accessing }
J2ParameterVariable >> expression [
	^ expression
]

{ #category : #accessing }
J2ParameterVariable >> expression: anObject [
	expression := anObject
]

{ #category : #accessing }
J2ParameterVariable >> index [
	^ index
]

{ #category : #accessing }
J2ParameterVariable >> index: anObject [
	index := anObject
]

{ #category : #accessing }
J2ParameterVariable >> message [
	^ message
]

{ #category : #accessing }
J2ParameterVariable >> message: anObject [
	message := anObject
]
