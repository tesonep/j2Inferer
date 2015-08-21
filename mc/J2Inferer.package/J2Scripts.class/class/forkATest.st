scripts
forkATest
	[ 
	J2SimpleClassTests new
		setTestSelector: #testRecursiveMethod;
		runCase ] forkAt: 20