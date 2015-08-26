enqueuing
enqueue: aTask
        (self shouldEnqueue: aTask)
                ifTrue: [
                        (queue at: aTask runLevel) addLast: aTask.
                        (inQueue at: aTask runLevel) add: aTask
                ]