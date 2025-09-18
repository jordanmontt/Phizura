Class {
	#name : 'PhizuraCodeEmitter',
	#superclass : 'Object',
	#instVars : [
		'records'
	],
	#category : 'Phizura-Core',
	#package : 'Phizura',
	#tag : 'Core'
}

{ #category : 'instance creation' }
PhizuraCodeEmitter class >> onRecords: anArray [

    ^ self new
          records: anArray;
          yourself
]

{ #category : 'api' }
PhizuraCodeEmitter >> emitCode [

	| previousTime generatedCode delay |
	previousTime := records first time.
	generatedCode := WriteStream on: String new.

	self writeExpression: records first on: generatedCode.
	
	records allButFirst doWithIndex: [ :record :index |
		delay := record time - previousTime.
		
		self writeDelay: delay on: generatedCode.
		generatedCode << String cr.
		self writeExpression: record on: generatedCode.
	
		previousTime := record time ].
	
	^ generatedCode contents
]

{ #category : 'accessing' }
PhizuraCodeEmitter >> records: anArray [

    records := anArray
]

{ #category : 'private' }
PhizuraCodeEmitter >> writeDelay: aDelay on: stream [

    stream << aDelay totalSeconds asFloat asString << ' seconds wait.' << String cr
]

{ #category : 'private' }
PhizuraCodeEmitter >> writeExpression: record on: stream [

    stream << record expression.
    record expression last = '.' ifTrue: [ stream << '.' ].
    stream << String cr.
    stream << '''' << record expression << ''' toLocal: ''evaluatedCommand''.' << String cr
]
