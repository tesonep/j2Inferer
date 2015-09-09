events
endProcess
	endTime := DateAndTime now.
	self log:['Process Finished. It took: ' , (endTime - startTime) asString ] level:#info.
