tasks operations
remainingContextPredefinedMessage: aMessage onContext: aContext
        "Apply the first predefined message that can handle, returning the remaining
        context after the apply, if none found the same calling context is returned."
        ^ predefinedMessages
                detect: [ :e | e canHandle: aMessage onContext: aContext ]
                ifFound: [ :e | e remainingContextFor: aMessage onContext: aContext ]
                ifNone: [ aContext ]