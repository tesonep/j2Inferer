scripts
inferAndSerialize
	" 
	It is intended to be used from the headless executer.
	J2Scripts inferAndSerialize
	"
	inferer := nil.
	Smalltalk garbageCollect.
	inferer := J2Inferer new.
	ProtoObject allSubclasses do: [ :e | inferer enqueueClass: e ].
	inferer runAndWait.
	
	self serializeToFile: 'typeInfo.fuel'.