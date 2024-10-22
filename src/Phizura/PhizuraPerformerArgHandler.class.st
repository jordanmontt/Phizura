Class {
	#name : 'PhizuraPerformerArgHandler',
	#superclass : 'PhizuraBasicHandler',
	#category : 'Phizura-Handlers',
	#package : 'Phizura',
	#tag : 'Handlers'
}

{ #category : 'evaluating' }
PhizuraPerformerArgHandler >> messageString: anArray [

	^ instrumentedMethod selector , ' ' , anArray first class name , ' new'
]
