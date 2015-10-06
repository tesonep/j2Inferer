as yet unclassified
groupByClass
	^ (self objects groupBy:[:e | e class]  having:[ :x | true]) asOrderedCollection sort:[:a :b | a size > b size].