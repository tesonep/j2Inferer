accessing
parameterFor: aName ifAbsent: aBlock
	| idx |
	idx := self parameters findFirst: [ :e | e name = aName asSymbol ].
	^ idx ~= 0
		ifTrue: [ self parameters at: idx ]
		ifFalse: aBlock