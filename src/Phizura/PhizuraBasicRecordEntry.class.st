Class {
	#name : 'PhizuraBasicRecordEntry',
	#superclass : 'Object',
	#instVars : [
		'time'
	],
	#category : 'Phizura-Core',
	#package : 'Phizura',
	#tag : 'Core'
}

{ #category : 'accessing' }
PhizuraBasicRecordEntry >> emitOnEmitter: emitter onStream: aStream [

    
]

{ #category : 'testing' }
PhizuraBasicRecordEntry >> isKeyEntryRecord [

    ^ false
]

{ #category : 'accessing' }
PhizuraBasicRecordEntry >> time [

	^ time
]

{ #category : 'accessing' }
PhizuraBasicRecordEntry >> time: aDateAndTime [

	time := aDateAndTime
]
