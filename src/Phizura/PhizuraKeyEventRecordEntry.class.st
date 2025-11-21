Class {
	#name : 'PhizuraKeyEventRecordEntry',
	#superclass : 'PhizuraBasicRecordEntry',
	#instVars : [
		'key'
	],
	#category : 'Phizura-Core',
	#package : 'Phizura',
	#tag : 'Core'
}

{ #category : 'accessing' }
PhizuraKeyEventRecordEntry >> emitMoofLODCodeOnEmitter: emitter onStream: aStream [

    emitter emitMoofLODKeyStroke: self on: aStream
]

{ #category : 'accessing' }
PhizuraKeyEventRecordEntry >> emitPerformanceCodeOnEmitter: emitter onStream: aStream [

	 emitter emitPerformanceKeyStroke: self on: aStream
]

{ #category : 'testing' }
PhizuraKeyEventRecordEntry >> isKeyEntryRecord [

    ^ true
]

{ #category : 'testing' }
PhizuraKeyEventRecordEntry >> isKeyEvent [

	^ true
]

{ #category : 'accessing' }
PhizuraKeyEventRecordEntry >> key [
	^ key
]

{ #category : 'accessing' }
PhizuraKeyEventRecordEntry >> key: aKey [

    key := aKey
]

{ #category : 'printing' }
PhizuraKeyEventRecordEntry >> printOn: aStream [

    aStream << 'KEY - '.
    self key asString printOn: aStream
]
