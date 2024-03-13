Class {
	#name : #J2TypeRectangleTest,
	#superclass : #J2AbstractTests,
	#category : 'J2Inferer-Tests'
}

{ #category : #tests }
J2TypeRectangleTest >> testCorner [
	| inf class var types |
	J2Inferer resetInstance.
	inf := J2Inferer instance.

	inf
		inferClass: Point;
		inferClass: Rectangle.

	class := inf typeInfoFor: Rectangle.
	var := class instanceVariable: #corner.
	types := (var possibleClassesInContext: (J2Context with: {class})) classes.
	
	self assertCollection: types hasSameElements: { inf typeInfoFor: Point }.
]

{ #category : #tests }
J2TypeRectangleTest >> testOrigin [
	| inf class var types |
	J2Inferer resetInstance.
	inf := J2Inferer instance.

	inf
		inferClass: Point;
		inferClass: Rectangle.

	class := inf typeInfoFor: Rectangle.
	var := class instanceVariable: #origin.
	types := (var possibleClassesInContext: (J2Context with: {class})) classes.
	
	self assertCollection: types hasSameElements: { inf typeInfoFor: Point }.
]
