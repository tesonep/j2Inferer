as yet unclassified
withClasses: aCollection
	| classes |
	classes := aCollection ifNotNil: [ Set newFrom: aCollection ] ifNil: [ Set new ].
	^ self new
		minClasses: classes;
		yourself