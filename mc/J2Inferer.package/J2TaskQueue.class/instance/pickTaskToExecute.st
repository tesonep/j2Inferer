as yet unclassified
pickTaskToExecute
	| x |
	(1 to: 5)
		do: [ :e | 
			(queue at: e)
				ifNotEmpty: [ 
					x := (queue at: e) removeFirst.
					inQueue remove: x.
					^ x ] ].
	CollectionIsEmpty signal.
