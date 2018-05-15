accessing
class: containerClass isInHierarchyOf: method
	| methodClass methodMetaClass|
	methodClass := method methodClass.

	methodClass isClass ifFalse:[^false].
	methodClass = containerClass ifTrue:[^true].	

	methodMetaClass := method methodClass class.
	methodMetaClass = containerClass ifTrue:[^true].

	(containerClass withAllSuperclasses includes: methodClass) ifTrue:[^true].
	(containerClass withAllSuperclasses includes: methodMetaClass) ifTrue:[^true].
	
	^ false.