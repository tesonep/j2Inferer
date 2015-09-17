initialization
config
	| numberTypes |
	numberTypes := Number allSubclasses collect: [ :e | inferer typeInfoFor: e ].
	
	parameters := { numberTypes }.
	selectors := #(#+ #* #-).
	implementingClasses := numberTypes.