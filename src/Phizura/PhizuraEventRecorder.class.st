Class {
	#name : 'PhizuraEventRecorder',
	#superclass : 'PhizuraRecorder',
	#category : 'Phizura',
	#package : 'Phizura'
}

{ #category : 'printing' }
PhizuraEventRecorder >> emitCode [

	| previousTime generatedCode |
	previousTime := records first time.
	generatedCode := String streamContents: [ :stream | stream << records first message << '.' << String cr ].

	records allButFirst do: [ :record |
			| delay |
			delay := record time - previousTime.
			generatedCode := generatedCode , delay totalSeconds asFloat asString , ' seconds wait.', String cr.
			generatedCode := generatedCode , '''' , record message ,'''', ' toLocal: ''evaluatedCommand''.' , String cr.
			generatedCode := generatedCode , record message , '.' , String cr.
			generatedCode := generatedCode , String cr.
			previousTime := record time ].
	
^ generatedCode
]

{ #category : 'initialization' }
PhizuraEventRecorder >> initialize [

	super initialize.
	instrumenter := PhizuraEventRecorderInstrumentor onRecorder: self
]
