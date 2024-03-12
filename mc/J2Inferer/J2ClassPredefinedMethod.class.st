Class {
	#name : #J2ClassPredefinedMethod,
	#superclass : #J2AbstractPredefinedMethod,
	#category : #'J2Inferer-PredefinedMethods'
}

{ #category : #initialization }
J2ClassPredefinedMethod >> config [
	selectors := #(#class)
]

{ #category : #accessing }
J2ClassPredefinedMethod >> parameters [
	^#()
]

{ #category : #applying }
J2ClassPredefinedMethod >> remainingContextFor: aMessage onContext: alreadyEvaluated [
	"There is nothing remaining, all the elements in the context are used"

	^ J2Context empty
]

{ #category : #applying }
J2ClassPredefinedMethod >> returnTypeFor: message onContext: aContext alreadyEvaluated: anObject [
	^ J2Type
		withClasses:
			(aContext
				collect: [ :e | inferer typeInfoFor: e analysedClass class ])
]
