"
This method has the return type of the base class of the receiver of the message.
"
Class {
	#name : #J2BasicNewPredefinedMethod,
	#superclass : #J2AbstractPredefinedMethod,
	#category : 'J2Inferer-PredefinedMethods'
}

{ #category : #initialization }
J2BasicNewPredefinedMethod >> config [
	selectors := #(#basicNew #basicNew:)
]

{ #category : #accessing }
J2BasicNewPredefinedMethod >> parameters [
	^#()
]

{ #category : #applying }
J2BasicNewPredefinedMethod >> remainingContextFor: aMessage onContext: alreadyEvaluated [
	"There is nothing remaining, all the elements in the context are used"

	^ J2Context empty
]

{ #category : #applying }
J2BasicNewPredefinedMethod >> returnTypeFor: message onContext: aContext alreadyEvaluated: anObject [
	^ J2Type
		withClasses:
			(aContext
				collect: [ :e | inferer typeInfoFor: e analysedClass instanceSide ])
]
