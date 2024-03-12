Class {
	#name : #J2AbstractTests,
	#superclass : #TestCase,
	#instVars : [
		'inferer',
		'astContainers'
	],
	#category : #'J2Inferer-Tests'
}

{ #category : #testing }
J2AbstractTests class >> isAbstract [

	^ self = J2AbstractTests
]

{ #category : #asserts }
J2AbstractTests >> anASTContainerCreated:aContainer for:aVariable [
	astContainers at:aVariable put:aContainer.
]

{ #category : #asserts }
J2AbstractTests >> assert: typeVariable hasMessages: aBunchOfMsgs onContext: context [
	self assert: ((typeVariable allSelectors: context) includesAll: aBunchOfMsgs)
		  description: [ 'Should have included: ' , aBunchOfMsgs printString , ' but included: ', typeVariable allSelectors printString ]
]

{ #category : #asserts }
J2AbstractTests >> assert: typeVariable hasTemporaryVariable: aVariableName [
	| container | 
	container := self containerFor: typeVariable.
	self assert: (container temporaryVariables at: aVariableName) isNotNil
		description: [ 'Variables: ' ,typeVariable temporaryVariables printString , ' not includes: ' , aVariableName  ]
]

{ #category : #asserts }
J2AbstractTests >> assert: typeVariable hasType: aBunchOfClasses onContext: aContext [ 
	| possibleClasses ps |
	ps := typeVariable possibleClassesInContext: (J2Context with:aContext).
	
	self assertAllMethodsOpened.
	
	self
		assert: [ ps isNotNil ]
		description: 'The possible classes are all classes in the instalation'.

	possibleClasses := ps classes collect: #analysedClass.
	self
		assert: (possibleClasses includesAll: aBunchOfClasses)
		description:
			[ 
			'Possible classes should have:' , aBunchOfClasses asArray printString , ' but found:'
				, possibleClasses asArray printString ].
	self
		assert: (possibleClasses difference: aBunchOfClasses) isEmpty
		description:
			[ 
			'Possible classes should have:' , aBunchOfClasses asArray printString , ' but found:'
				, possibleClasses asArray printString ]
]

{ #category : #asserts }
J2AbstractTests >> assertAllMethodsOpened [
	self assertCollection: ((inferer classes values flatCollect: #methods) reject:#isUpdated) equals: #().
]

{ #category : #asserts }
J2AbstractTests >> containerFor:aVariable [
	^ astContainers at: aVariable.
]

{ #category : #infering }
J2AbstractTests >> contextFor: aBunchOfClasses [
	^aBunchOfClasses collect:[ :each | inferer typeInfoFor: each]
]

{ #category : #infering }
J2AbstractTests >> inferAllParentsAndMetas: aBunch [
	| newBunch |
	newBunch := Set new.
	newBunch addAll: aBunch.
	newBunch addAll: (aBunch flatCollect:#allSuperclasses).
	newBunch addAll: (newBunch collect: #class).
	newBunch addAll: (newBunch flatCollect:#allSuperclasses).
	^self inferClasses: newBunch.
]

{ #category : #infering }
J2AbstractTests >> inferClass: aClass [
	inferer inferClass:aClass.
	^ inferer typeInfoFor: aClass.
]

{ #category : #infering }
J2AbstractTests >> inferClasses: aBunch [
	aBunch do:[:aClass | inferer enqueueClass: aClass].
	inferer runAndWait.
]

{ #category : #infering }
J2AbstractTests >> inferMethod: aMethod [
	inferer inferMethod: aMethod.
	^ (inferer typeInfoFor: aMethod methodClass)
		methodTypeFor: aMethod
]

{ #category : #infering }
J2AbstractTests >> infoOfClass: aClass [.
	^ inferer typeInfoFor: aClass.
]

{ #category : #running }
J2AbstractTests >> setUp [
	super setUp.
	astContainers := IdentityDictionary new.
	inferer := J2Inferer default.
	inferer registerASTContainerListener: self.
	
	

]

{ #category : #running }
J2AbstractTests >> tearDown [
	super tearDown.
	inferer notifier logClasses.
	
]
