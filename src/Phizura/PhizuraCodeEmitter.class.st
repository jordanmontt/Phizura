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

{ #category : 'private' }
PhizuraCodeEmitter >> emitCodeOnRecords: aCollection using: aBlock [

	| previousTime generatedCode delay  |
	aCollection ifEmpty: [ ^ '' ].

	previousTime := aCollection first time.
	generatedCode := WriteStream on: String new.

	aBlock value: aCollection first value: generatedCode.

	aCollection allButFirst doWithIndex: [ :record :index |
			delay := record time - previousTime.
			self writeDelay: delay on: generatedCode.
			generatedCode << String cr.
			aBlock value: record value: generatedCode.
			previousTime := record time ].

	^ generatedCode contents
]

{ #category : 'api' }
PhizuraCodeEmitter >> emitMoofLODCode [

	^ self
		emitCodeOnRecords: records
		using: [ :record :stream | record emitMoofLODCodeOnEmitter: self onStream: stream ]
]

{ #category : 'double dispatch API' }
PhizuraCodeEmitter >> emitMoofLODExpression: record on: stream [

	|cleanedExpression|
	cleanedExpression := self emitPerformanceExpression: record on: stream.

	stream << (self escapeSingleQuotes: cleanedExpression) surroundedBySingleQuotes << ' toLocal: ''evaluatedCommand''.'.
	stream << String cr
]

{ #category : 'double dispatch API' }
PhizuraCodeEmitter >> emitMoofLODKeyStroke: record on: stream [

    record key value  printOn: stream.
    stream << ' toLocal: ''keyPressed''.'.
    stream << String cr
]

{ #category : 'api' }
PhizuraCodeEmitter >> emitPerformanceCode [

	^ self
		emitCodeOnRecords: (records reject: #isKeyEvent)
		using: [ :record :stream | record emitPerformanceCodeOnEmitter: self onStream: stream ]
]

{ #category : 'double dispatch API' }
PhizuraCodeEmitter >> emitPerformanceExpression: record on: stream [

	| cleanedExpression |
	cleanedExpression := record expression trimBoth.
	cleanedExpression last = $. ifFalse: [ cleanedExpression := cleanedExpression , '.' ].

	stream << cleanedExpression.
	stream << String cr.
	^ cleanedExpression
]

{ #category : 'double dispatch API' }
PhizuraCodeEmitter >> emitPerformanceKeyStroke: record on: stream [
	"Do nothing"

	
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
