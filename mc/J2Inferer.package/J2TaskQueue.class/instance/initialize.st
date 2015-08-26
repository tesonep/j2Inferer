as yet unclassified
initialize
        super initialize.
        queue := Dictionary new: 5.
        (1 to: 5) do: [ :e | queue at: e put: OrderedCollection new ].
        runStart := 0.
        inQueue := Set new