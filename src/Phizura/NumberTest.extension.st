Extension { #name : 'NumberTest' }

{ #category : '*Phizura' }
NumberTest >> testRevertBpm [

	self assert: 142 equals: 142 bpm revertBpm.
	self assert: 15 equals: 15 bpm revertBpm.
	self assert: 111 equals: 111 bpm revertBpm
]
