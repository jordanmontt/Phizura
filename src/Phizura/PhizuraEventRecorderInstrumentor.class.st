Class {
	#name : 'PhizuraEventRecorderInstrumentor',
	#superclass : 'Object',
	#instVars : [
		'recorder',
		'coypuEvaluate'
	],
	#category : 'Phizura-Instrumentation',
	#package : 'Phizura',
	#tag : 'Instrumentation'
}

{ #category : 'instance creation' }
PhizuraEventRecorderInstrumentor class >> onRecorder: aRecorder [

	^ self basicNew
		  recorder: aRecorder;
		  initialize;
		  yourself
]

{ #category : 'instrumentation' }
PhizuraEventRecorderInstrumentor >> basicArgHandler [

	^ PhizuraEventHandler onRecorder: recorder
]

{ #category : 'initialization' }
PhizuraEventRecorderInstrumentor >> initialize [

	super initialize.
	self initializeMethodProxies
]

{ #category : 'initialization' }
PhizuraEventRecorderInstrumentor >> initializeMethodProxies [

	coypuEvaluate := MpMethodProxy
		onMethod: SpCodeMooflodEvaluateCommand >> #executeCode:
		handler: self basicArgHandler
]

{ #category : 'api' }
PhizuraEventRecorderInstrumentor >> instrument [

	self proxyVariables do: #install.
	MpMethodProxy enableInstrumentation
]

{ #category : 'instrumentation' }
PhizuraEventRecorderInstrumentor >> proxyVariables [

	self flag:
		'IMPORTANT: Here one needs to return all the instances variables that hold a proxy.'.
	^ { coypuEvaluate }
]

{ #category : 'accessing' }
PhizuraEventRecorderInstrumentor >> recorder: aRecorder [

	recorder := aRecorder
]

{ #category : 'api' }
PhizuraEventRecorderInstrumentor >> uninstrument [

	self proxyVariables do: #uninstall.
	MpMethodProxy disableInstrumentation
]
