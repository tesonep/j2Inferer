accessing
classes
	| newSet |
	newSet := Set new: minClasses size.
"	sorted := SortedCollection new: minClasses size; sortBlock: [ :a :b | a < b].
	sorted addAll: minClasses.
"	
	newSet addAll: minClasses.	
	
	^ newSet.