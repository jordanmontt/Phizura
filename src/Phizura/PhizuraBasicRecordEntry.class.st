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
PhizuraBasicRecordEntry >> emitMoofLODCodeOnEmitter: emitter onStream: aStream [

	self subclassResponsibility
]

{ #category : 'accessing' }
PhizuraBasicRecordEntry >> emitPerformanceCodeOnEmitter: emitter onStream: aStream [

	self subclassResponsibility
]

{ #category : 'testing' }
PhizuraBasicRecordEntry >> isKeyEntryRecord [

    ^ false
]

{ #category : 'testing' }
PhizuraBasicRecordEntry >> isKeyEvent [

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
