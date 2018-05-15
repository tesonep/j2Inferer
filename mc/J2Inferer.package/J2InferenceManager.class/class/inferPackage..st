scripts
inferPackage: aPackage
	J2Inferer instance ifNil: [ 
			J2Inferer withNotifier: J2StdOutNotifier new.
		].

	aPackage classes
		do: [ :e | J2Inferer instance enqueueClass: e ]
		displayingProgress: [ :e | e name ].
		
	J2Inferer instance runAndWait.
	J2Inferer instance notifier close.
	^ J2Inferer instance