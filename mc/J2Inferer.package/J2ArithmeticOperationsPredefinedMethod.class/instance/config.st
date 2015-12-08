initialization
config
	implementingClasses := Number allSubclasses collect: [ :e | inferer typeInfoFor: e ].
	parametersTypes := {implementingClasses}.
	selectors := #(#+ #* #- #/ #//).
	parameters := {((J2Variable newOnClass: ( inferer typeInfoFor: Number))
		variableName: 'parameter1';
		yourself)}