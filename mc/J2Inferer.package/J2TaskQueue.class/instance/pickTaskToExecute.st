private
pickTaskToExecute
	| x |
	self runLevelInterval
		do: [ :e | 
			(queue at: e)
				ifNotEmpty: [ 
					x := (queue at: e) removeFirst.
					(inQueue at:e) remove: x.
					^ x ] ].
	CollectionIsEmpty signal