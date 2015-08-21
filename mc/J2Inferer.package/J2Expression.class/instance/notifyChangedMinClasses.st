accessing
notifyChangedMinClasses
	self supertypes do:[:e | e minClassesChanged: self]