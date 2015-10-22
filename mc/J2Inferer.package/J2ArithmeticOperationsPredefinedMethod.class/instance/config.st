initialization
config
	implementingClasses := Number allSubclasses collect: [ :e | inferer typeInfoFor: e ].
	parametersTypes := {implementingClasses}.
	selectors := #(#+ #* #- #/ #//).
	parameters := {(J2Variable new
		variableName: 'parameter1';
		yourself)}