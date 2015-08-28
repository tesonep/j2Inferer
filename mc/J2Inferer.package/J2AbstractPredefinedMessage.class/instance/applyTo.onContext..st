applying
applyTo: aMessage onContext:aContext 
	"It apply the predefined message to the received message node on the given context. 
	It should return the remaining context after the application of the predefined message.
	The remaining context is then analysed in the usual way"
	self subclassResponsibility 