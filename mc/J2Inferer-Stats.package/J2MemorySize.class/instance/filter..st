as yet unclassified
filter: obj.
	obj ifNil:[^false].
	obj isCompiledMethod ifTrue:[^false].
	obj isClass ifTrue:[^false].
	obj isTrait ifTrue:[^false].
	(obj isKindOf: SmallInteger) ifTrue:[^false].
	(obj isKindOf: Boolean) ifTrue:[^false].
	^true.