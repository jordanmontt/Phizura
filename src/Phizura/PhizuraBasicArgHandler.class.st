Class {
	#name : 'PhizuraBasicArgHandler',
	#superclass : 'PhizuraBasicHandler',
	#category : 'Phizura',
	#package : 'Phizura'
}

{ #category : 'evaluating' }
PhizuraBasicArgHandler >> messageString: anArray [

	^ instrumentedMethod selector , ' ' , anArray first asString
]
