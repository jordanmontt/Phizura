"
I'm a ""do it and inspect"" command.
I will select all contents of a playground and I will execute it, inspecting the result.
"
Class {
	#name : 'PhizuraRecordCommand',
	#superclass : 'StPlaygroundCommand',
	#category : 'Phizura-Playground-Commands',
	#package : 'Phizura-Playground',
	#tag : 'Commands'
}

{ #category : 'default' }
PhizuraRecordCommand class >> defaultDescription [

	^ 'Record the performance and the key strokes'
]

{ #category : 'accessing' }
PhizuraRecordCommand class >> defaultIconName [

	^ #smallNew
]

{ #category : 'default' }
PhizuraRecordCommand class >> defaultName [

	^ 'Phizurear'
]

{ #category : 'accessing' }
PhizuraRecordCommand class >> order [

    ^ 100
]

{ #category : 'executing' }
PhizuraRecordCommand >> execute [

	| buttonPresenter |
	buttonPresenter := context toolbar items 
		detect: [ :e | e help = self class defaultDescription ].

	PhiRecorderInstance isRecording
		ifTrue: [
				PhiRecorderInstance stopRecording.
				self setRecordingStatusForButton: buttonPresenter ]
		ifFalse: [
				PhiRecorderInstance record.
				self setStopStatusForButton: buttonPresenter ]
]

{ #category : 'executing' }
PhizuraRecordCommand >> setRecordingStatusForButton: buttonPresenter [

	buttonPresenter
		label: self class defaultName;
		icon: (self iconNamed: self class defaultIconName)
]

{ #category : 'executing' }
PhizuraRecordCommand >> setStopStatusForButton: buttonPresenter [

	buttonPresenter
		label: 'Stop Phizureada';
		icon: (self iconNamed: #cancel)
]
