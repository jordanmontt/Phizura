Extension { #name : 'Number' }

{ #category : '*Phizura' }
Number >> revertBpm [

	^ 60 / (4 * self)
]
