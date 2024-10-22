Class {
	#name : 'PhizuraBasicArgHandler',
	#superclass : 'PhizuraBasicHandler',
	#category : 'Phizura-Handlers',
	#package : 'Phizura',
	#tag : 'Handlers'
}

{ #category : 'evaluating' }
PhizuraBasicArgHandler >> messageString: anArray [

	^ instrumentedMethod selector , ' ' , anArray first asString
]
