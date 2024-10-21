Class {
	#name : 'PhizuraPerformerArgHandler',
	#superclass : 'PhizuraBasicHandler',
	#category : 'Phizura',
	#package : 'Phizura'
}

{ #category : 'evaluating' }
PhizuraPerformerArgHandler >> messageString: anArray [

	^ 'performer: ' , anArray first class name , ' new'
]
