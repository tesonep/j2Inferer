accessing
class: containerClass isInHierarchyOf: method
	| methodClass methodMetaClass|
	methodClass := method methodClass.

	methodClass isClass ifFalse:[^false].
	methodClass = containerClass ifTrue:[^true].	

	methodMetaClass := method methodClass class.
	methodMetaClass = containerClass ifTrue:[^true].

	(methodClass allSuperclasses includes: containerClass) ifTrue:[^true].
	(methodMetaClass allSuperclasses includes: containerClass) ifTrue:[^true].
	
	^ false.