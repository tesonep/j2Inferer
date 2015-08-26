private
isInQueue: aTask.
	^ (inQueue at:aTask runLevel) includes:aTask.
	