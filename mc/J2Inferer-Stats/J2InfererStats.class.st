"
These objects represents the result of analysing the inference results.
"
Class {
	#name : #J2InfererStats,
	#superclass : #Object,
	#instVars : [
		'results',
		'dateTime'
	],
	#category : 'J2Inferer-Stats'
}

{ #category : #stats }
J2InfererStats >> averageInstanceVariablesWithData [
	self instanceVariables isZero ifTrue: [ ^0 ].
	^ self instanceVariablesWithData / self instanceVariables 
]

{ #category : #stats }
J2InfererStats >> averageMethodsReturnTypeWithData [
	self methods isZero ifTrue: [ ^0 ].
	^ self methodsReturnTypeWithData / self methods 
]

{ #category : #stats }
J2InfererStats >> averageParametersWithData [
	self parameters isZero ifTrue: [ ^0 ].
	^ self parametersWithData / self parameters.
]

{ #category : #stats }
J2InfererStats >> blockInstanceVariables [
	^ results sum:#blockInstanceVariables.
]

{ #category : #stats }
J2InfererStats >> blockReturnTypes [
	^ results sum:#blockReturnTypes.
]

{ #category : #filling }
J2InfererStats >> calculatePackage: package from: inferer [
	| data | 
	data := J2PackageData new.
	data fillPackage: package from: inferer.
	results add:data.
]

{ #category : #accessing }
J2InfererStats >> dateTime [
	^ dateTime
]

{ #category : #stats }
J2InfererStats >> duration [
	^ results sum:#duration.
]

{ #category : #filling }
J2InfererStats >> fillPackages: packages from: inferer [
	dateTime := DateAndTime new.
	results := IdentitySet new.
	
	packages 
		do: [ :each | self calculatePackage: each from:inferer ] 
		displayingProgress: [ :each | each name ].
]

{ #category : #stats }
J2InfererStats >> initialize [
	super initialize.
	results := #().
]

{ #category : #stats }
J2InfererStats >> instanceVariables [
	^ results sum:#totalVariables.
]

{ #category : #stats }
J2InfererStats >> instanceVariablesWithData [
	^ results sum:#withDataVariables.
]

{ #category : #stats }
J2InfererStats >> methods [
	^ results sum:#totalMethods.
]

{ #category : #stats }
J2InfererStats >> methodsReturnTypeWithData [
	^ results sum:#withDataReturn.
]

{ #category : #stats }
J2InfererStats >> parameters [
	^ results sum:#totalParameters.
]

{ #category : #stats }
J2InfererStats >> parametersWithData [
	^ results sum:#withDataParameters.
]

{ #category : #printing }
J2InfererStats >> printOn: aStream [
	results ifEmpty: [ aStream << 'Empty Stats'. ^ self ].

	aStream << 'Inferer stats:'; crlf;
			<< '  Packages: '; << results size printString; crlf;
			<< '  Average instance variables with data: '; << (self averageInstanceVariablesWithData * 100.0) printString; crlf;
			<< '  Average methods return with data: ' ; << (self averageMethodsReturnTypeWithData * 100.0) printString; crlf;
			<< '  Average parameters with data: ' ; << (self averageParametersWithData * 100.0) printString; crlf;
			<< '  Duration: '; << self duration printString.
	
]
