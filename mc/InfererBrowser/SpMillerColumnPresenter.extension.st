Extension { #name : #SpMillerColumnPresenter }

{ #category : #'*InfererBrowser' }
SpMillerColumnPresenter >> removeAllAfter: aPage [
	"remove all columns after this page."

	| index |
	index := self pages indexOf: aPage ifAbsent: 0.
	self resetTo: index.
	self selectPage: index
]
