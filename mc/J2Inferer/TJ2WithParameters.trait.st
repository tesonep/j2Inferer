"
This trait has the common behavior between the block and the method.
"
Trait {
	#name : #TJ2WithParameters,
	#category : 'J2Inferer-Variables'
}

{ #category : #accessing }
TJ2WithParameters >> addParameterFor: aName at: index [
	self parameters at: index put: ((J2Variable newOnClass: self classTypeInfo)
						variableName: aName asSymbol;
						yourself).
]

{ #category : #accessing }
TJ2WithParameters >> fillParameters: anAstNode [
	anAstNode arguments ifEmpty: [ ^self ].
	self parameters: (Array new:  anAstNode arguments size).
	anAstNode arguments doWithIndex: [ :each :index | self addParameterFor: each name at:index ]
]

{ #category : #accessing }
TJ2WithParameters >> parameterFor: aName ifAbsent: aBlock [
	| idx |
	idx := self parameters findFirst: [ :e | e name = aName asSymbol ].
	^ idx ~= 0
		ifTrue: [ self parameters at: idx ]
		ifFalse: aBlock
]
