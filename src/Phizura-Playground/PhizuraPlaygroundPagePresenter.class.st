Class {
	#name : 'PhizuraPlaygroundPagePresenter',
	#superclass : 'StPlaygroundPagePresenter',
	#category : 'Phizura-Playground-Playground',
	#package : 'Phizura-Playground',
	#tag : 'Playground'
}

{ #category : 'private commands' }
PhizuraPlaygroundPagePresenter class >> baseToolbarCommands [

	^ {
		  StPlaygroundDoItCommand.
		  StPlaygroundPublishCommand.
		  StPlaygroundBindingsCommand.
		  StPlaygroundPagesCommand.

		  PhizuraRecordCommand.
		  PhizuraCleanRecorderCommand.
		  PhizuraInspectRecorderCommand.
		  PhizuraOpenMoofLODCommand.
		  PhizuraOpenRecordsCommand }
]

{ #category : 'initialization' }
PhizuraPlaygroundPagePresenter >> connectPresenters [

    super connectPresenters.
    self recordKeyStrokes
]

{ #category : 'commands' }
PhizuraPlaygroundPagePresenter >> doEvaluateAndGo [

	^ self doEvaluateAndGoFor: text selectedTextOrLine
]

{ #category : 'commands' }
PhizuraPlaygroundPagePresenter >> doEvaluateAndGoFor: selectedText [

	| value |
	activationBlock ifNil: [ ^ self ].

	value := text
		evaluate: selectedText
		onCompileError: [ ^ self ]
		onError: [ :e | e pass ].

	activationBlock value: value
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
            PhiRecorderInstance addRecord: (PhizuraKeyEventRecordEntry
                     time: DateAndTime now
                     key: event key) ]
]

{ #category : 'accessing' }
PhizuraPlaygroundPagePresenter >> toolbar [

	^ toolbar
]
