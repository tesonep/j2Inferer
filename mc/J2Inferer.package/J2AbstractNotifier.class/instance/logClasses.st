logging
logClasses
	| ordered |.
	ordered := SortedCollection new.
	inferer classes do: [ :c | ordered add: String tab , c printString ].
	ordered do:[:e | self log:e level:#info].