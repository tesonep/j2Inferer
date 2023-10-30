Extension { #name : #SpMillerPaginatorPresenter }

{ #category : #'*InfererBrowser' }
SpMillerPaginatorPresenter >> removeAllAfter: aPresenter [

	millerList removeAllAfter: aPresenter.
	self updatePaginator:
		(millerList pages size - millerList visiblePages + 1 max: 1)
]
