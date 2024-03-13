Class {
	#name : #J2IdentityEqualsPredefinedMethod,
	#superclass : #J2AbstractPredefinedMethod,
	#category : #'J2Inferer-PredefinedMethods'
}

{ #category : #initialization }
J2IdentityEqualsPredefinedMethod >> config [
	selectors := #(#==)
]

{ #category : #accessing }
J2IdentityEqualsPredefinedMethod >> parameters [
	^#()
]

{ #category : #applying }
J2IdentityEqualsPredefinedMethod >> remainingContextFor: aMessage onContext: alreadyEvaluated [
	"There is nothing remaining, all the elements in the context are used"

	^ J2Context empty
]

{ #category : #applying }
J2IdentityEqualsPredefinedMethod >> returnTypeFor: message onContext: aContext alreadyEvaluated: anObject [
	^ J2Type
		withClasses:
			(aContext
				collect: [ :e | inferer typeInfoFor: Boolean ])
]
