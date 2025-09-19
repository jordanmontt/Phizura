Class {
	#name : 'PhizuraPlaygroundPresenter',
	#superclass : 'StPlaygroundPresenter',
	#category : 'Phizura-Playground-Playground',
	#package : 'Phizura-Playground',
	#tag : 'Playground'
}

{ #category : 'initialization' }
PhizuraPlaygroundPresenter >> initializeWindow: aWindowPresenter [

    super initializeWindow: aWindowPresenter.
    aWindowPresenter
        whenClosedDo: [ PhiRecorderInstance stopRecording ];
        title: 'Phizura Playground '
]

{ #category : 'private - factory' }
PhizuraPlaygroundPresenter >> newDefaultPlaygroundPage [

	^  PhizuraPlaygroundPage new
]
