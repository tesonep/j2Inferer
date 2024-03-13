"
When a predefined message is detected, a predefined method is used insted of a normal one.
This behave polymorphically with the J2Method but is programmed by hand to represent a special behavior.
"
Class {
	#name : #J2AbstractPredefinedMethod,
	#superclass : #Object,
	#instVars : [
		'inferer',
		'parametersTypes',
		'implementingClasses',
		'selectors'
	],
	#category : 'J2Inferer-PredefinedMethods'
}

{ #category : #'instance creation' }
J2AbstractPredefinedMethod class >> forInferer: anInferer [
	^ self basicNew 
			inferer: anInferer;
			initialize;
			yourself.
]

{ #category : #'instance creation' }
J2AbstractPredefinedMethod class >> new [
	^ self error: 'Should use forInferer:'
]

{ #category : #'testing if can handle' }
J2AbstractPredefinedMethod >> canHandle: aMessage onContext: aContext [
	^ (self selectorsMatches: aMessage onContext: aContext) 
		and: [ (self receiverClassesMatches: aMessage onContext: aContext) 
			and: [ self parametersMatches: aMessage onContext: aContext ] ]
]

{ #category : #initialization }
J2AbstractPredefinedMethod >> config [
	self subclassResponsibility 
]

{ #category : #accessing }
J2AbstractPredefinedMethod >> inferer [
	^ inferer
]

{ #category : #accessing }
J2AbstractPredefinedMethod >> inferer: anObject [
	inferer := anObject
]

{ #category : #initialization }
J2AbstractPredefinedMethod >> initialize [
	super initialize.
	implementingClasses := #().
	parametersTypes := #().
	selectors := #().
	self config.

]

{ #category : #blocks }
J2AbstractPredefinedMethod >> isBlockOn: aContext alreadyEvaluated: alreadyEvaluatedSet [
	^ false.
]

{ #category : #accessing }
J2AbstractPredefinedMethod >> parameters [
	^ self subclassResponsibility.
]

{ #category : #'testing if can handle' }
J2AbstractPredefinedMethod >> parametersMatches: aMessage onContext: aContext [
	^ parametersTypes size = aMessage parameters size
]

{ #category : #'testing if can handle' }
J2AbstractPredefinedMethod >> receiverClassesMatches: aMessage onContext: aContext [.
	^ implementingClasses isEmpty
		or: [ aContext contents includesAny: implementingClasses ]
]

{ #category : #applying }
J2AbstractPredefinedMethod >> remainingContextFor: aMessage onContext: aContext [
	"It apply the predefined message to the received message node on the given context.
        It should return the remaining context after the application of the predefined message.
        The remaining context is then analysed in the usual way"

	self subclassResponsibility
]

{ #category : #'testing if can handle' }
J2AbstractPredefinedMethod >> selectorsMatches: aMessage onContext: aContext [
	^ selectors isEmpty or: [ selectors includes: aMessage selector ]
]
