Class {
	#name : 'PhizuraInstrumenter',
	#superclass : 'Object',
	#instVars : [
		'proxyActiveDSP',
		'proxyFreq',
		'proxyUniqueInstance',
		'proxyPerformer',
		'proxyMute',
		'proxyMuteAll',
		'proxySolo',
		'proxyPlay',
		'proxyStop',
		'proxyAtPut'
	],
	#category : 'Phizura',
	#package : 'Phizura'
}

{ #category : 'api' }
PhizuraInstrumenter >> allRecords [

	^ (self proxyVariables flatCollect: [ :each | each handler records ]) sorted: [ :a :b |
		  a time < b time ]
]

{ #category : 'instrumentation' }
PhizuraInstrumenter >> handlerClass [

	^ PhizuraInstrumenterHandler
]

{ #category : 'initialization' }
PhizuraInstrumenter >> initialize [

	super initialize.
	self initializeMethodProxies
]

{ #category : 'initialization' }
PhizuraInstrumenter >> initializeMethodProxies [

	proxyActiveDSP := MpMethodProxy phizuraOnMethod: Performance >> #activeDSP: handlerClass: self handlerClass.
	proxyFreq := MpMethodProxy phizuraOnMethod: Performance >> #freq: handlerClass: self handlerClass.
	proxyUniqueInstance := MpMethodProxy phizuraOnMethod: Performance class >> #uniqueInstance handlerClass: self handlerClass.
	proxyPerformer := MpMethodProxy phizuraOnMethod: Performance >> #performer handlerClass: self handlerClass.
	proxyAtPut := MpMethodProxy phizuraOnMethod: Performance >> #at:put: handlerClass: self handlerClass.
	proxyMute := MpMethodProxy phizuraOnMethod: Performance >> #mute: handlerClass: self handlerClass.
	proxyMuteAll := MpMethodProxy phizuraOnMethod: Performance >> #muteAll handlerClass: self handlerClass.
	proxySolo := MpMethodProxy phizuraOnMethod: Performance >> #solo: handlerClass: self handlerClass.
	proxyPlay := MpMethodProxy phizuraOnMethod: Performance >> #play handlerClass: self handlerClass.
	proxyStop := MpMethodProxy phizuraOnMethod: Performance >> #stop handlerClass: self handlerClass
]

{ #category : 'api' }
PhizuraInstrumenter >> instrument [

	self proxyVariables do: #install
]

{ #category : 'instrumentation' }
PhizuraInstrumenter >> proxyVariables [

	self flag:
		'IMPORTANT: Here one needs to return all the instances variables that hold a proxy.'.
	^ {
		  proxyActiveDSP.
		  proxyFreq.
		  proxyUniqueInstance.
		  proxyPerformer.
		  proxyMute.
		  proxyMuteAll.
		  proxySolo.
		  proxyPlay.
		  proxyStop.
		  proxyAtPut }
]

{ #category : 'api' }
PhizuraInstrumenter >> uninstrument [

	self proxyVariables do: #uninstall
]
