creating globals
addGlobalVariable: aGlobalNode
	globals
		at: aGlobalNode name
		ifAbsentPut: [ J2GlobalVariable new variableName: aGlobalNode name; yourself ]