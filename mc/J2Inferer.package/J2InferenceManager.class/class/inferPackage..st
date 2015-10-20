scripts
inferPackage: aPackage
	inferer ifNil: [ 
			inferer := J2Inferer new.
			inferer initWithNotifier: J2StdOutNotifier new.
		].

	aPackage classes
		do: [ :e | inferer enqueueClass: e ]
		displayingProgress: [ :e | e name ].
		
	inferer runAndWait.
	inferer notifier close.
	^ inferer