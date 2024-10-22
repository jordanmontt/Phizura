Class {
	#name : 'PhizuraFreqHandler',
	#superclass : 'PhizuraBasicHandler',
	#category : 'Phizura-Handlers',
	#package : 'Phizura',
	#tag : 'Handlers'
}

{ #category : 'evaluating' }
PhizuraFreqHandler >> messageString: anInt [

	^ instrumentedMethod selector , ' ' , anInt revertBpm asString , ' bpm'
]
