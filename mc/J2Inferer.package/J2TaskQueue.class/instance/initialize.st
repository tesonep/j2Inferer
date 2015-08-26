initialization
initialize
	super initialize.
	queue := Dictionary new: self numberOfRunLevels.
	inQueue := Dictionary new: self numberOfRunLevels.
	
	runStart := 0.
	self runLevelInterval
		do: [ :e | 
			queue at: e put: (OrderedCollection new:65000).
			inQueue at: e put: (Set new:65000) ]