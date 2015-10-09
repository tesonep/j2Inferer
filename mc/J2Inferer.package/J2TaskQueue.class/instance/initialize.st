initialization
initialize
	super initialize.
	queue := Dictionary new: self numberOfRunLevels.
	inQueue := Dictionary new: self numberOfRunLevels.
	
	runStart := 0.
	self clearQueue.