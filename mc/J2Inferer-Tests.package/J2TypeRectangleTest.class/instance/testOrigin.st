tests
testOrigin
	| inf class var types |
	J2Inferer resetInstance.
	inf := J2Inferer instance.

	inf
		inferClass: Point;
		inferClass: Rectangle.

	class := inf typeInfoFor: Rectangle.
	var := class instanceVariable: #origin.
	types := (var possibleClasses: (J2Context with: {class})) classes.
	
	self assertCollection: types hasSameElements: { inf typeInfoFor: Point }.