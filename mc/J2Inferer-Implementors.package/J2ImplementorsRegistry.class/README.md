A very specialized cache for resolving the implementors of a selector or a bunch of selectors.

- fill Fill all the data.
- implementorsOf: aSelector returns the set of implementors of this selector.
- implementorsOfAll: aBunchOfSelectos taking the collection of selectors it returns the set of classes implementing all the selectors.
- singleImplementorOf: aBunchOfSelectors taking the collection of selectors it returns, if there is, the single implementor that can understand all of this messages.