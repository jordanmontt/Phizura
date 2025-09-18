Class {
	#name : 'PhizuraPlaygroundPagePresenter',
	#superclass : 'StPlaygroundPagePresenter',
	#category : 'Phizura-Playground-Playground',
	#package : 'Phizura-Playground',
	#tag : 'Playground'
}

{ #category : 'private commands' }
PhizuraPlaygroundPagePresenter class >> baseToolbarCommands [

    ^ super baseToolbarCommands , { PhizuraRecordCommand . PhizuraStopRecordCommand . PhizuraCleanRecorderCommand . PhizuraInspectRecorderCommand }
]

{ #category : 'initialization' }
PhizuraPlaygroundPagePresenter >> connectPresenters [

    super connectPresenters.
    self recordKeyStrokes
]

{ #category : 'initialization' }
PhizuraPlaygroundPagePresenter >> initializePresenters [

    super initializePresenters.

    text interactionModel: (PhizuraPlaygroundInteractionModel new
             bindingToSelf: self;
             yourself)
]

{ #category : 'initialization' }
PhizuraPlaygroundPagePresenter >> recordKeyStrokes [

    self text eventHandler whenKeyUpDo: [ :event |
            PhiRecorderInstance addRecord: (PhizuraKeyEventRecordEntry new
                     key: event key;
                     time: DateAndTime now;
                     yourself) ]
]
