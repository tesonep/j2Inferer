implementors-queries
singleImplementorOf: aBunchOfMessages
	^self implementorsRegistry singleImplementorOf: (aBunchOfMessages collect:#selector)