Class {
	#name : 'PhizuraEvaluationInstrumentor',
	#superclass : 'PhizuraInstrumentor',
	#instVars : [
		'doItAndGo',
		'evaluateAndGo',
		'playgroundPage'
	],
	#category : 'Phizura-Instrumentation',
	#package : 'Phizura',
	#tag : 'Instrumentation'
}

{ #category : 'instance creation' }
PhizuraEvaluationInstrumentor class >> onRecorder: aRecorder playgroundPage: aPlaygroundPage [

    ^ self basicNew
          recorder: aRecorder;
          playgroundPage: aPlaygroundPage;
          initialize;
          yourself
]

{ #category : 'initialization' }
PhizuraEvaluationInstrumentor >> initialize [

    super initialize.
    instrumentationHandler playgroundPage: playgroundPage
]

{ #category : 'initialization' }
PhizuraEvaluationInstrumentor >> initializeMethodProxies [

	evaluateAndGo := MpMethodProxy
		onMethod: SpCodeSelectionCommand >> #evaluate:andDo:
		handler: instrumentationHandler.
	doItAndGo := MpMethodProxy
		onMethod: PhizuraPlaygroundPagePresenter >> #doEvaluateAndGoFor:
		handler: instrumentationHandler.

	proxyVariables addAll: { evaluateAndGo . doItAndGo }
]

{ #category : 'initialization' }
PhizuraEvaluationInstrumentor >> playgroundPage: aPlaygroundPage [

    playgroundPage := aPlaygroundPage
]
