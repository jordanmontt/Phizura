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

    PhiRecorderInstance record
]
