Class {
	#name : 'PhizuraInstrumentor',
	#superclass : 'Object',
	#instVars : [
		'recorder',
		'proxyVariables'
	],
	#category : 'Phizura-Instrumentation',
	#package : 'Phizura',
	#tag : 'Instrumentation'
}

{ #category : 'copying' }
PhizuraInstrumentor >> , anotherInstrumentator [

    anotherInstrumentator class = self class ifFalse: [ self error: 'Argument is not an instrumentator' ].
    ^ self class new
          proxyVariables: self proxyVariables , anotherInstrumentator proxyVariables;
          yourself
]

{ #category : 'initialization' }
PhizuraInstrumentor >> initialize [

	super initialize.
	self initializeProxyVariables.
	self initializeMethodProxies
]

{ #category : 'initialization' }
PhizuraInstrumentor >> initializeProxyVariables [

    proxyVariables := OrderedCollection new
]

{ #category : 'api' }
PhizuraInstrumentor >> instrument [

	self proxyVariables do: #install.
	MpMethodProxy enableInstrumentation
]

{ #category : 'instrumentation' }
PhizuraInstrumentor >> phizuraHandler [

	^ PhizuraHandler onRecorder: recorder
]

{ #category : 'instrumentation' }
PhizuraInstrumentor >> proxyVariables [

	^ proxyVariables
]

{ #category : 'instrumentation' }
PhizuraInstrumentor >> proxyVariables: aCollection [

    proxyVariables := aCollection
]

{ #category : 'accessing' }
PhizuraInstrumentor >> recorder: aRecorder [

	recorder := aRecorder
]

{ #category : 'api' }
PhizuraInstrumentor >> uninstrument [

	self proxyVariables do: #uninstall.
	MpMethodProxy disableInstrumentation
]
