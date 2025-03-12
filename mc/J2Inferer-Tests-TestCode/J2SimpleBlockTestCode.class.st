Class {
	#name : #J2SimpleBlockTestCode,
	#superclass : #Object,
	#instVars : [
		'aVariable'
	],
	#category : 'J2Inferer-Tests-TestCode-Blocks'
}

{ #category : #'test code' }
J2SimpleBlockTestCode >> anotherMethodPassingParameter [
	^ self do: [ 123 ].
]

{ #category : #'test code' }
J2SimpleBlockTestCode >> concatenatedBlock [
	^ [ :a | [ :b | b ] value:a ] value: aVariable.
]

{ #category : #'test code' }
J2SimpleBlockTestCode >> do: aBlock [
	^ aBlock value.
]

{ #category : #'test code' }
J2SimpleBlockTestCode >> initialize [
	aVariable := 23.
]

{ #category : #'test code' }
J2SimpleBlockTestCode >> soSimpleBlockTest [
	| bar |
	bar := [ :x | 23 ].
	^ bar value: self.
]
