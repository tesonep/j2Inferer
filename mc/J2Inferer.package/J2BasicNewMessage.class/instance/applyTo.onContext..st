applying
applyTo: aMessage onContext: aContext
	aMessage methodOpened: self predefinedMethod.
	"There is nothing remaining, all the elements in the context are used"
	^ #().