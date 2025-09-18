Class {
	#name : 'PhizuraPlaygroundInteractionModel',
	#superclass : 'StPlaygroundInteractionModel',
	#instVars : [
		'bindingToSelf'
	],
	#category : 'Phizura-Playground-Playground',
	#package : 'Phizura-Playground',
	#tag : 'Playground'
}

{ #category : 'accessing' }
PhizuraPlaygroundInteractionModel >> bindingToSelf: anObject [

	bindingToSelf := anObject 
]

{ #category : 'accessing' }
PhizuraPlaygroundInteractionModel >> doItReceiver [

    ^ bindingToSelf
]
