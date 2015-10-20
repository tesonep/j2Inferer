infering
inferAllParentsAndMetas: aBunch
	| newBunch |
	newBunch := Set new.
	newBunch addAll: aBunch.
	newBunch addAll: (aBunch flatCollect:#allSuperclasses).
	newBunch addAll: (newBunch collect: #class).
	newBunch addAll: (newBunch flatCollect:#allSuperclasses).
	^self inferClasses: newBunch.