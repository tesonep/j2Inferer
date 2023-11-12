"
These objects represents the type variable for a class. 
It does contains all the instance variables and methods, and the relationship with the other classes.
"
Class {
	#name : #J2Class,
	#superclass : #Object,
	#instVars : [
		'methods',
		'instanceVariables',
		'superclass',
		'analysedClass',
		'metaClass'
	],
	#category : #'J2Inferer-Variables'
}

{ #category : #methods }
J2Class >> addVariableFor: aName [
	instanceVariables ifNil:[instanceVariables := IdentityDictionary new].

	^instanceVariables
		at: aName asSymbol 
		ifAbsentPut: [ 
			(J2Variable newOnClass: self)
				variableName: aName;
				yourself ]
]

{ #category : #'as yet unclassified' }
J2Class >> allSubclasses [
	^self checkIfHasManySubclasses:[
		self analysedClass allSubclasses collect: [ :c | self inferer typeInfoFor: c ]
	]
]

{ #category : #accessing }
J2Class >> analysedClass [
	^ analysedClass
]

{ #category : #accessing }
J2Class >> analysedClass: anObject [
	analysedClass := anObject
]

{ #category : #'as yet unclassified' }
J2Class >> canUnderstand: aSelector [ 
	^self analysedClass canUnderstand: aSelector.
]

{ #category : #'as yet unclassified' }
J2Class >> checkIfHasManySubclasses: aBlock [
	self analysedClass allSubclasses size > self inferer config maxNumberSubclassesToOpen
		ifTrue: [ ^ #() ].
	^ aBlock value
]

{ #category : #methods }
J2Class >> createMethodVariableFor: aMethod [
	| m |
	self inferer enqueueAllMethodsUpdated.
	^ aMethod methodClass = self analysedClass
		ifTrue: [ 
				m := J2Method new
					selector: aMethod selector;
					classTypeInfo: self;
					fillReturn;
					fillParameters: aMethod ast;
					yourself.
				methods ifNil:[ methods := Dictionary new ].
				methods at: aMethod selector put: m ]
		ifFalse: [ superclass methodTypeFor: aMethod ]
]

{ #category : #'as yet unclassified' }
J2Class >> distanceToTop [
	^ superclass ifNil:[ 0 ] ifNotNil: [ 1 + superclass distanceToTop ]
		 
]

{ #category : #methods }
J2Class >> fill [
	self fillSuperclass.
	self fillVariables.
	self fillMetaclass.
]

{ #category : #variables }
J2Class >> fillMetaclass [
	metaClass := self inferer typeInfoFor: self analysedClass class.  
]

{ #category : #methods }
J2Class >> fillSuperclass [
	self analysedClass superclass ifNotNil: [ 
		superclass := self inferer typeInfoFor: self analysedClass superclass.	
	]
]

{ #category : #variables }
J2Class >> fillVariables [
	| variables |
	self flag: #TODO. "probably should not add class-side vars like this"
	variables := self analysedClass instVarNames, self analysedClass class instVarNames.
	variables ifNotNil: [ variables do: [ :v | self addVariableFor: v ] ].
	self analysedClass classVariablesString
		ifNotEmpty: [ (self analysedClass classVariablesString splitOn: ' ')
				do: [ :v | self addVariableFor: v ] ]
]

{ #category : #accessing }
J2Class >> inferer [
	^ J2Inferer instance
]

{ #category : #accessing }
J2Class >> instanceVariable: aName [
	^ self instanceVariables 
		at: aName asSymbol 
		ifAbsent:[ 
			superclass 
				ifNil:[ self error: 'Undefined instance variable:', aName]
				ifNotNil: [ superclass instanceVariable: aName ]
		]
]

{ #category : #accessing }
J2Class >> instanceVariables [
"Returns teh dictionary if exists and a new one if it is empty."
	^ instanceVariables ifNil:[ IdentityDictionary new].
]

{ #category : #'as yet unclassified' }
J2Class >> lookupSelector: aSelector [
	^self analysedClass lookupSelector: aSelector
]

{ #category : #accessing }
J2Class >> metaClass [
	^ metaClass
]

{ #category : #accessing }
J2Class >> metaClass: anObject [
	metaClass := anObject
]

{ #category : #methods }
J2Class >> methodTypeFor: aMethod [
	^ self methods at: aMethod selector ifAbsent: [ self createMethodVariableFor: aMethod ]
]

{ #category : #accessing }
J2Class >> methods [
	^ methods ifNil:[^ Dictionary new].
]

{ #category : #methods }
J2Class >> name [
	^self analysedClass name.
]

{ #category : #methods }
J2Class >> numberOfMethods [
	^ self methods size.
]

{ #category : #accessing }
J2Class >> package [
	^ self analysedClass package.
]

{ #category : #initialization }
J2Class >> printOn: aStream [
	aStream
		nextPutAll: 'a J2Class (';
		nextPutAll: self name; nextPut: $)
]

{ #category : #accessing }
J2Class >> selfAndSuperclasses [
	^ self selfAndSuperclasses: Set new
]

{ #category : #accessing }
J2Class >> selfAndSuperclasses:alreadyCalculated [ 
	(alreadyCalculated includes:self) ifTrue:[^alreadyCalculated].
	alreadyCalculated add: self.

	superclass ifNil: [ ^ alreadyCalculated].
	^ superclass selfAndSuperclasses: alreadyCalculated
]

{ #category : #'as yet unclassified' }
J2Class >> subclasses [
	^ self analysedClass subclasses collect:[:e | self inferer typeInfoFor: e].
]

{ #category : #'as yet unclassified' }
J2Class >> superclass [
	^ superclass
]

{ #category : #accessing }
J2Class >> superclasses [
	^ self selfAndSuperclasses remove: self; yourself.
]

{ #category : #accessing }
J2Class >> undefinedVariable: aName [.
	^ self addVariableFor: aName.
]

{ #category : #accessing }
J2Class >> variableFor: aNode [
	^ self
		variableFor: aNode
		ifAbsent:
			[ self inferer variableFor: aNode ifAbsent: [ self undefinedVariable: aNode infererSource ] ]
]

{ #category : #accessing }
J2Class >> variableFor: aNode ifAbsent: aValuable [
	| aName |
	aName := aNode asString asSymbol .
	^ self instanceVariables at: aName ifAbsent: [ 
		superclass ifNil:aValuable
			ifNotNil:[
				superclass variableFor: aNode ifAbsent:aValuable.
			].
	]
]
