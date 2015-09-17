scripts
inferAllInstalation
	" J2Scripts inferAllInstalation"

	inferer := nil.
	Smalltalk garbageCollect.
	inferer := J2Inferer new.
	
   "[" 
	  ProtoObject withAllSubclasses do: [ :e | inferer enqueueClass: e ] displayingProgress: [:e | e name].
	  inferer runAndWait.
	  inferer notifier close.
	"] timeProfile" "forkAt: 20" 

	
	^ inferer.