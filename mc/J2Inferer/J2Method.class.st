"
A method is a crucial part in the algorithm. 
It does contains the parameters and the return type. 
"
Class {
	#name : #J2Method,
	#superclass : #Object,
	#traits : 'TJ2WithParameters',
	#classTraits : 'TJ2WithParameters classTrait',
	#instVars : [
		'classTypeInfo',
		'parameters',
		'selector',
		'updated',
		'returnValue'
	],
	#category : #'J2Inferer-Variables'
}

{ #category : #comparing }
J2Method >> = other [

	^ self class = other class and: [
		  classTypeInfo = other classTypeInfo and: [
			  selector = other selector ] ]
]

{ #category : #updating }
J2Method >> addReturnSubtype: anExpression [
	self returnValue addSubtype: anExpression
]

{ #category : #accessing }
J2Method >> classTypeInfo [
	^ classTypeInfo
]

{ #category : #accessing }
J2Method >> classTypeInfo: anObject [
	classTypeInfo := anObject
]

{ #category : #updating }
J2Method >> cleanForUpdate [
	self returnValue removeAllSubtypes.
]

{ #category : #initialization }
J2Method >> fillReturn [
	returnValue := (J2Variable newOnClass: classTypeInfo )
		variableName: '^';
		yourself
]

{ #category : #updating }
J2Method >> forceUpdate [
	updated := false.
]

{ #category : #comparing }
J2Method >> hash [

	^ (self class hash bitXor: classTypeInfo hash) bitXor: selector hash
]

{ #category : #accessing }
J2Method >> inferer [
	^ J2Inferer instance
]

{ #category : #initialization }
J2Method >> initialize [
	super initialize.
	updated := false.

]

{ #category : #accessing }
J2Method >> isUpdated [
	^ updated.
]

{ #category : #accessing }
J2Method >> method [
	^ self classTypeInfo analysedClass >> selector.
]

{ #category : #accessing }
J2Method >> name [
	^ self method name , ' @ ', self classTypeInfo name
]

{ #category : #accessing }
J2Method >> parameters [
	^ parameters ifNil:[#()]
]

{ #category : #accessing }
J2Method >> parameters: aValue [
	parameters := aValue.
]

{ #category : #accessing }
J2Method >> printOn: aStream [
	aStream
		nextPutAll: 'a J2Method (';
		nextPutAll: self name;
		nextPut: $)
]

{ #category : #accessing }
J2Method >> returnValue [
	^returnValue
]

{ #category : #accessing }
J2Method >> returnValue: aValue [.
	returnValue := aValue.
]

{ #category : #accessing }
J2Method >> selector [
	^ selector
]

{ #category : #accessing }
J2Method >> selector: anObject [
	selector := anObject
]

{ #category : #updating }
J2Method >> updateIfNeeded [

	self isUpdated ifTrue: [ ^ self ].
	self inferer notifier openingMethod: self.
	self cleanForUpdate.
	J2AstVisitor new
		method: self;
		visitNode: self method ast.
	updated := true.
	self inferer notifier openMethod: self
]
