scripts
inferAllInstalation
	" J2Scripts inferAllInstalation"

	J2Inferer resetInstance.
	Smalltalk garbageCollect.
	J2Inferer withNotifier: J2StdOutNotifier new.

	ProtoObject withAllSubclasses
		do: [ :e | J2Inferer instance enqueueClass: e ]
		displayingProgress: [ :e | e name ].
		
	J2Inferer instance runAndWait.
	J2Inferer instance notifier close.
	
	^ J2Inferer instance