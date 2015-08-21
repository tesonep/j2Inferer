creating globals
addGlobalVariable: aGlobalNode
	globals
		at: aGlobalNode infererSource
		ifAbsentPut: [ J2GlobalVariable new variableName: aGlobalNode name; inferer:self; yourself ]