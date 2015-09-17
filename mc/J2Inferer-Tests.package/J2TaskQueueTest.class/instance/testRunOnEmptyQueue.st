tests
testRunOnEmptyQueue
	self should: [ self taskQueue runOne ] raise: CollectionIsEmpty.