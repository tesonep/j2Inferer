initialization
config
	selectors := #(#+ #*).
	implementingClasses := {Number} , Number allSubclasses collect: [ :e | inferer typeInfoFor: e ]