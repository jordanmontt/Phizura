Class {
	#name : 'PhizuraPlaygroundPagePresenter',
	#superclass : 'StPlaygroundPagePresenter',
	#instVars : [
		'perf',
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
	
	self emitKeyStrokes.
	"self recordKeyStrokes"
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
PhizuraPlaygroundPagePresenter >> emitKeyStrokes [

	self text eventHandler whenKeyUpDo: [ :event | "if Command is depressed"
		"event keyValue inspect."
			event key value = 65515 ifTrue: [ 0 toLocal: 'strobo' ].
			{
			"any key except space bar takes out the thunder"
			event keyValue = 32 ifTrue: [ 1 toLocalAsInt: 'thunder' ] ifFalse: [ 0 toLocalAsInt: 'thunder' ] .
				(Random new nextIntegerBetween: 0 and: 200).
				(event keyValue * 2) } toLocal: 'test' ].

	"key downs"
	"comand"
	self text eventHandler whenKeyDownDo: [ :event | "event keyValue inspect."
			event keyValue toLocalAsInt: 'keyValue'.
			"comand"
			event key value = 65515 ifTrue: [ "whatever" 255 toLocal: 'strobo' ] ]
]

{ #category : 'initialization' }
PhizuraPlaygroundPagePresenter >> initialize [

	super initialize.
	self initializeRecorder.
	"performer := PerformerLocal new.
	perf := Performance uniqueInstance performer: performer"
]

{ #category : 'initialization' }
PhizuraPlaygroundPagePresenter >> initializePresenters [

    super initializePresenters.

    text interactionModel: (PhizuraPlaygroundInteractionModel new
             bindingToSelf: self;
             yourself)
]

{ #category : 'initialization' }
PhizuraPlaygroundPagePresenter >> initializeRecorder [

    PhiRecorderInstance := PhizuraRecorder new.
    PhiRecorderInstance playgroundPage: self
]

{ #category : 'initialization' }
PhizuraPlaygroundPagePresenter >> recordKeyStrokes [

	self text eventHandler whenKeyUpDo: [ :event |
			PhiRecorderInstance addRecord:
				(PhizuraKeyEventRecordEntry time: DateAndTime now key: event key
					 cursorPosition: self text cursorPosition) ]
]

{ #category : 'accessing' }
PhizuraPlaygroundPagePresenter >> toolbar [

	^ toolbar
]
