Class {
	#name : 'PhizuraBasicSingletonHandler',
	#superclass : 'PhizuraBasicHandler',
	#category : 'Phizura',
	#package : 'Phizura'
}

{ #category : 'evaluating' }
PhizuraBasicSingletonHandler >> messageString: anObj [

	^ 'uniqueInstance'
]

{ #category : 'evaluating' }
PhizuraBasicSingletonHandler >> receiverString: anObj [

	^ 'Performance'
]
