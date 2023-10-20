Class {
	#name : #IBTypeInfoSuggestion,
	#superclass : #SugsSuggestion,
	#instVars : [
		'astContext'
	],
	#category : 'InfererBrowser-Sugesstions'
}

{ #category : #'as yet unclassified' }
IBTypeInfoSuggestion class >> createInferTypeSuggestion [
	<globalCommand>

	^ (IBTypeInfoSuggestion
		icon: Smalltalk ui icons smallJustifiedIcon
		position: 0
		keyText: 't')
		label:'Type Info';
		yourself
]

{ #category : #'ast contexts' }
IBTypeInfoSuggestion >> anASTContainerCreated: anASTContext for: aVariable [
	astContext := anASTContext.
]

{ #category : #'as yet unclassified' }
IBTypeInfoSuggestion >> execute [
	| inferer node methodNode methodVariable typeVariable | 
	
	inferer := J2Inferer instance.
	node := context selectedNode.
	methodNode := node methodNode.
	methodVariable := inferer methodVariableFor: methodNode method.
	methodVariable forceUpdate.
	
	inferer registerASTContainerListener: self.
	inferer inferMethod: methodVariable method.
	inferer unregisterASTContainerListener: self.
	
	typeVariable := astContext atExpression: node.
	
	IBBrowser openOn: (typeVariable asIBModel: {methodVariable classTypeInfo}).
]
