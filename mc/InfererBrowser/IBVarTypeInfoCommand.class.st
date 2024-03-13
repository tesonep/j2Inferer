Class {
	#name : #IBVarTypeInfoCommand,
	#superclass : #SycVariableCommand,
	#instVars : [
		'astContext'
	],
	#category : #'InfererBrowser-Sugesstions'
}

{ #category : #activation }
IBVarTypeInfoCommand class >> fullBrowserMenuActivation [

	<classAnnotation>
	^ CmdContextMenuActivation
		  byItemOf: ClyQueryMenuGroup
		  for: ClyFullBrowserVariableContext
]

{ #category : #activation }
IBVarTypeInfoCommand class >> sourceCodeMenuActivation [

	<classAnnotation>
	^ SycSourceCodeMenuActivation
		  byItemOf: ClyQueryMenuGroup
		  for: ClySourceCodeContext
]

{ #category : #asserts }
IBVarTypeInfoCommand >> anASTContainerCreated: anASTContext for: aVariable [
	astContext := anASTContext.
]

{ #category : #accessing }
IBVarTypeInfoCommand >> defaultMenuIconName [
	^ #hierarchy
]

{ #category : #accessing }
IBVarTypeInfoCommand >> defaultMenuItemName [
	^ 'Type info'
]

{ #category : #'as yet unclassified' }
IBVarTypeInfoCommand >> execute [

	| inferer methods typeVariable class |
	inferer := J2Inferer instance.

	methods := (ClyVariableReferencesQuery
		            of: variables first
		            from: (ClySystemEnvironmentScope
				             of: ClySystemEnvironment currentImage
				             in: ClyNavigationEnvironment currentImage)) execute
		           items.

	methods do: [ :method |
		| methodVariable |
		methodVariable := inferer methodVariableFor: method.
		methodVariable forceUpdate.

		inferer enqueueMethod: methodVariable method ].

	inferer runAndWait.
	
	class := inferer classes at: variables first definingClass name.
	typeVariable := class instanceVariables at: variables first name.

	IBBrowser openModel: (typeVariable asIBModelOnContext: { class })
]
