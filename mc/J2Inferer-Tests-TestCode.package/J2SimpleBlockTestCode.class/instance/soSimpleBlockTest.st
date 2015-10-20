test code
soSimpleBlockTest
	| bar |
	bar := [ :x | 23 ].
	^ bar value: self.