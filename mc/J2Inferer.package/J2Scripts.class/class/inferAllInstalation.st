scripts
inferAllInstalation
	" J2Scripts inferAllInstalation"
	inferer := nil.
	Smalltalk garbageCollect.
	inferer := J2Inferer new.
	ProtoObject allSubclasses do: [ :e | inferer enqueueClass: e ].
	[ inferer runAndWait ] forkAt: 20
	