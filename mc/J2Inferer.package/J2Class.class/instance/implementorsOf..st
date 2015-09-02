accessing
implementorsOf: aSelector
   ^ self selectAllMethods:[:e | e selector = aSelector]