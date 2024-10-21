Class {
	#name : 'PhizuraAtPutHandler',
	#superclass : 'PhizuraBasicHandler',
	#category : 'Phizura',
	#package : 'Phizura'
}

{ #category : 'evaluating' }
PhizuraAtPutHandler >> messageString: anArray [

	^ String streamContents: [ :aStream |
		  aStream << 'at: #' << anArray first << ' put: '.
		  anArray second printOn: aStream ]
]
