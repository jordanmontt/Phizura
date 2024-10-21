Extension { #name : 'Performance' }

{ #category : '*Phizura' }
Performance >> asStashConstructor [

	^ self className , ' uniqueInstance'
]
