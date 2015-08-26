as yet unclassified
enqueue: aTask
        (self shouldEnqueue: aTask)
                ifTrue: [
                        (queue at: aTask runLevel) addLast: aTask.
                        inQueue add: aTask
                ]