as yet unclassified
singleImplementorOf: bunchOfSelectors
	| possible |

	possible := self implementorsOfAll: bunchOfSelectors.
	^ (possible size = 1) ifTrue:possible ifFalse:nil.
	