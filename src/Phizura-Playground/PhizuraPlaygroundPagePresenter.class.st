Class {
	#name : 'PhizuraPlaygroundPagePresenter',
	#superclass : 'StPlaygroundPagePresenter',
	#category : 'Phizura-Playground-Playground',
	#package : 'Phizura-Playground',
	#tag : 'Playground'
}

{ #category : 'initialization' }
PhizuraPlaygroundPagePresenter >> initializePresenters [

    super initializePresenters.

    text interactionModel: (PhizuraPlaygroundInteractionModel new
             bindingToSelf: self;
             yourself)
]
