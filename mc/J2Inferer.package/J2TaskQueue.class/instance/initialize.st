as yet unclassified
initialize
	super initialize.
	queue := OrderedCollection new.
	runStart := 0.
	alreadyInQueue := Set new.