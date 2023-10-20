Class {
	#name : #IBBrowser,
	#superclass : #Object,
	#instVars : [
		'pager'
	],
	#category : 'InfererBrowser'
}

{ #category : #'instance creation' }
IBBrowser class >> openOn: anIBVariable [
	^ self new
		openOn: anIBVariable;
		yourself
]

{ #category : #'as yet unclassified' }
IBBrowser class >> openOn: aPackage using: anInferer [
	^ self new
		openOn: aPackage using: anInferer;
		yourself
]

{ #category : #'as yet unclassified' }
IBBrowser >> openOn: aIBModel [
	pager := GLMPager new.
	pager title: 'Type Inferer Browser'.
	pager with: [ :factory | factory show: [ :builder :element | element buildView: builder ] ].
	pager openOn: aIBModel
]

{ #category : #'as yet unclassified' }
IBBrowser >> openOn: aPackage using: anInferer [
	self openOn: (IBPackageModel for: aPackage using: anInferer)
]
