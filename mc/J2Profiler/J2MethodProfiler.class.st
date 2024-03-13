Class {
	#name : #J2MethodProfiler,
	#superclass : #Object,
	#instVars : [
		'method'
	],
	#classInstVars : [
		'active',
		'stream',
		'file'
	],
	#category : 'J2Profiler'
}

{ #category : #'as yet unclassified' }
J2MethodProfiler class >> activateProfile [
	active := true.
	file := File openFileNamed: 'profile.out'.
	stream := file writeStream.
	stream << 'Profile activated.'.
	stream crlf.
	stream flush.
]

{ #category : #'as yet unclassified' }
J2MethodProfiler class >> deactivateProfile [
	self isProfileActive
		ifTrue: [ 
			stream << 'Profile deactivated'.
			stream crlf.
			stream close.
			file close. ].
	active := false.
	stream := nil.
	file := nil
]

{ #category : #'as yet unclassified' }
J2MethodProfiler class >> isProfileActive [
	active ifNil:[^false].
	^active.
]

{ #category : #'as yet unclassified' }
J2MethodProfiler class >> log: aMessage [
	stream << aMessage.
	stream crlf.
	stream flush
]

{ #category : #'as yet unclassified' }
J2MethodProfiler class >> profile: aMethod [
	| w |
	(aMethod isKindOf: J2MethodProfiler)
		ifTrue: [ ^ aMethod ].
	w := self new.
	w method: aMethod.
	aMethod methodClass addSelector: aMethod selector withMethod: w.
	^ w
]

{ #category : #'as yet unclassified' }
J2MethodProfiler class >> profileClass: aClass [.
	aClass methodsDo: [ :m | self profile: m ]
]

{ #category : #'as yet unclassified' }
J2MethodProfiler class >> profilePackage: aPackageName [
	| pck |
	pck := RPackageOrganizer default packageNamed: aPackageName. pck classes do: [ :c | self profileClass: c ]
]

{ #category : #'as yet unclassified' }
J2MethodProfiler class >> unprofile: aMethodProfiler [
	(aMethodProfiler isKindOf: J2MethodProfiler)
		ifFalse: [ ^ aMethodProfiler ].
	aMethodProfiler method methodClass addSelector: aMethodProfiler method selector withMethod: aMethodProfiler method.

]

{ #category : #'as yet unclassified' }
J2MethodProfiler class >> unprofileClass: aClass [
	aClass methodsDo: [ :m | self unprofile: m ]
]

{ #category : #'as yet unclassified' }
J2MethodProfiler class >> unprofilePackage: aPackageName [
	| pck |
	pck := RPackageOrganizer default packageNamed: aPackageName.
	pck classes do: [ :c | self unprofileClass: c ]
]

{ #category : #'as yet unclassified' }
J2MethodProfiler >> doesNotUnderstand: aMessage [
	^ method perform: aMessage selector withArguments: aMessage arguments .
]

{ #category : #accessing }
J2MethodProfiler >> method [
	^ method
]

{ #category : #accessing }
J2MethodProfiler >> method: anObject [
	method := anObject
]

{ #category : #accessing }
J2MethodProfiler >> run: aMethod with: parameters in: aReceiver [
	| r |
	self class isProfileActive
		ifTrue:
			[ 
			self class
				log:
					'Running ' , aMethod name , ' with ' , (parameters collect: #class) printString , ' in ' , aReceiver class printString
						, aReceiver identityHash printString ].
	r := method valueWithReceiver: aReceiver arguments: parameters.
	self class isProfileActive
		ifTrue:
			[ 
			self class
				log:
					'Run ' , aMethod name , ' with ' , (parameters collect: #class) printString , ' in ' , aReceiver class printString
						, aReceiver identityHash printString ].
	^ r
]
