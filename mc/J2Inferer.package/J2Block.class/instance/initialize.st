accessing
initialize
	super initialize.
	parameters := OrderedCollection new.
	returnType := J2Variable new container: self; inferer:inferer; yourself.