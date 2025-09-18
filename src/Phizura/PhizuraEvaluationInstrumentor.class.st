Class {
	#name : 'PhizuraEvaluationInstrumentor',
	#superclass : 'PhizuraInstrumentor',
	#instVars : [
		'coypuEvaluate'
	],
	#category : 'Phizura-Instrumentation',
	#package : 'Phizura',
	#tag : 'Instrumentation'
}

{ #category : 'instance creation' }
PhizuraEvaluationInstrumentor class >> onRecorder: aRecorder [

	^ self basicNew
		  recorder: aRecorder;
		  initialize;
		  yourself
]

{ #category : 'initialization' }
PhizuraEvaluationInstrumentor >> initializeMethodProxies [

    coypuEvaluate := MpMethodProxy
			onMethod: SpCodeSelectionCommand >> #evaluate:andDo:
    		handler: self phizuraHandler.
    proxyVariables add: coypuEvaluate
]
