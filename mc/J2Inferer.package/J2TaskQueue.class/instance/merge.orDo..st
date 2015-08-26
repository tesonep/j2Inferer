enqueuing
merge: aTask orDo: aBlock
	| anotherTask | 
	anotherTask := self findInQueue: aTask.
	anotherTask ifNil: aBlock ifNotNil:[ 
		anotherTask mergeWith: aTask].