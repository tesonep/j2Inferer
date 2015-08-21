as yet unclassified
handleError: anError onTask: aTask
	(aTask class canPerform: #onError:)
		ifTrue: [ aTask onError: anError ]
		ifFalse: [ self notifier onError: anError ]