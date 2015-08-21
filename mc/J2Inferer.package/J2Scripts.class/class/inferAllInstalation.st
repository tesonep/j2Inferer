scripts
inferAllInstalation
	inferer := nil.
	Smalltalk garbageCollect.
	inferer := J2Inferer new.
	ProtoObject allSubclasses do: [ :e | inferer enqueueClass: e ].
	inferer runAndWait