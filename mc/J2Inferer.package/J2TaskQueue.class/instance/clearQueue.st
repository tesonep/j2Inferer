initialization
clearQueue
	self runLevelInterval
		do: [ :e | 
			queue at: e put: LinkedList new.
			inQueue at: e put: Set new ]