"
These objects represents the result of analysing the inference results on a specific package.
"
Class {
	#name : #J2PackageData,
	#superclass : #Object,
	#instVars : [
		'name',
		'totalVariables',
		'withDataVariables',
		'totalMethods',
		'withDataReturn',
		'totalParameters',
		'withDataParameters',
		'duration',
		'blockVariables',
		'blockReturnTypes'
	],
	#category : 'J2Inferer-Stats'
}

{ #category : #accessing }
J2PackageData >> blockInstanceVariables [
	^ blockVariables
]

{ #category : #accessing }
J2PackageData >> blockReturnTypes [
	^ blockReturnTypes
]

{ #category : #accessing }
J2PackageData >> duration [
	^ duration
]

{ #category : #'as yet unclassified' }
J2PackageData >> fillPackage: package from: inferer [
	| classes |
	name := package name.
	totalVariables := 0.
	totalMethods := 0.
	totalParameters := 0.
	withDataVariables := 0.
	withDataReturn := 0.
	withDataParameters := 0.
	blockVariables := 0.
	blockReturnTypes := 0.
	classes := package classes reject: #isTrait.
	
	duration := [classes do: [ :cls | self processClass: cls from: inferer ] displayingProgress: [ :e | e name ]] timeToRun.
]

{ #category : #'as yet unclassified' }
J2PackageData >> name [
	^ name.
]

{ #category : #'as yet unclassified' }
J2PackageData >> processClass: cls from: inferer [
	| type |
	type := inferer typeInfoFor: cls.

	totalVariables := totalVariables + type instanceVariables size.
	withDataVariables := withDataVariables + type instanceVariablesWithData.
	blockVariables := blockVariables + type blockInstanceVariables.

"	totalMethods := totalMethods + type methods size.
	withDataReturn := withDataReturn + type returnTypesWithData.
	blockReturnTypes := blockReturnTypes + type blockReturnTypes.
	
	type methods 
		ifNotEmpty: 
			[totalParameters := totalParameters + (type methods sum:[:m | m parameters size]).]"
]

{ #category : #accessing }
J2PackageData >> totalMethods [
	^ totalMethods
]

{ #category : #accessing }
J2PackageData >> totalParameters [
	^ totalParameters
]

{ #category : #accessing }
J2PackageData >> totalVariables [
	^ totalVariables
]

{ #category : #accessing }
J2PackageData >> withDataParameters [
	^ withDataParameters
]

{ #category : #accessing }
J2PackageData >> withDataReturn [
	^ withDataReturn
]

{ #category : #accessing }
J2PackageData >> withDataVariables [
	^ withDataVariables
]
