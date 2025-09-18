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

	records first emitOnEmitter: self onStream: generatedCode.
	
	records allButFirst doWithIndex: [ :record :index |
		delay := record time - previousTime.
		
		self writeDelay: delay on: generatedCode.
		generatedCode << String cr.
		record emitOnEmitter: self onStream: generatedCode.
	
		previousTime := record time ].
	
	^ generatedCode contents
]

{ #category : 'private' }
PhizuraCodeEmitter >> emitExpression: record on: stream [

	| cleanedExpression |
	cleanedExpression := record expression trimBoth.
	cleanedExpression last = $. ifFalse: [ cleanedExpression := cleanedExpression , '.' ].
	
	stream << cleanedExpression.
	stream << String cr.
	stream << (self escapeSingleQuotes: cleanedExpression) surroundedBySingleQuotes << ' toLocal: ''evaluatedCommand''.'.
	stream << String cr
]

{ #category : 'private' }
PhizuraCodeEmitter >> emitKeyStroke: record on: stream [

    record key value printOn: stream.
    stream << ' toLocal: ''keyPressed''.'.
    stream << String cr
]

{ #category : 'private' }
PhizuraCodeEmitter >> escapeSingleQuotes: expression [

	| stream |
	stream := WriteStream on: String new.

    expression do: [ :car |
			car = $'
				ifTrue: [ stream << car << car ]
				ifFalse: [ stream << car ] ].
	^ stream contents 
]

{ #category : 'accessing' }
PhizuraCodeEmitter >> records: anArray [

    records := anArray
]

{ #category : 'private' }
PhizuraCodeEmitter >> writeDelay: aDelay on: stream [

    stream << aDelay totalSeconds asFloat asString << ' seconds wait.' << String cr
]
