Class {
	#name : 'PhizuraPlaygroundPagePresenter',
	#superclass : 'StPlaygroundPagePresenter',
	#instVars : [
		'perf',
		'performer'
	],
	#classInstVars : [
		'performer'
	],
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
PhizuraPlaygroundPagePresenter >> initialize [

	super initialize.
	performer := PerformerLocal new.
	perf := Performance uniqueInstance performer: self performer
]

{ #category : 'initialization' }
PhizuraPlaygroundPagePresenter >> initializePresenters [

    super initializePresenters.

    text interactionModel: (PhizuraPlaygroundInteractionModel new
             bindingToSelf: self;
             yourself)
]

{ #category : 'accessing' }
PhizuraPlaygroundPagePresenter >> perf [

	^ perf
]

{ #category : 'accessing' }
PhizuraPlaygroundPagePresenter >> performer [

	^ performer
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
