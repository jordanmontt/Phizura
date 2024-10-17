Class {
	#name : 'CoypuInstrumenter',
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
	#category : 'MpCoypuRecorder',
	#package : 'MpCoypuRecorder'
}

{ #category : 'api' }
CoypuInstrumenter >> allRecords [

	^ self proxyVariables collect: [:each | each handler records]
]

{ #category : 'instrumentation' }
CoypuInstrumenter >> handlerClass [

	^ CoypuInstrumenterHandler
]

{ #category : 'initialization' }
CoypuInstrumenter >> initialize [

	super initialize.
	self initializeMethodProxies
]

{ #category : 'initialization' }
CoypuInstrumenter >> initializeMethodProxies [

	proxyActiveDSP := MpMethodProxy coypuOnMethod: Performance >> #activeDSP: handlerClass: self handlerClass.
	proxyFreq := MpMethodProxy coypuOnMethod: Performance >> #freq: handlerClass: self handlerClass.
	proxyUniqueInstance := MpMethodProxy coypuOnMethod: Performance class >> #uniqueInstance handlerClass: self handlerClass.
	proxyPerformer := MpMethodProxy coypuOnMethod: Performance >> #performer handlerClass: self handlerClass.
	proxyAtPut := MpMethodProxy coypuOnMethod: Performance >> #at:put: handlerClass: self handlerClass.
	proxyMute := MpMethodProxy coypuOnMethod: Performance >> #mute: handlerClass: self handlerClass.
	proxyMuteAll := MpMethodProxy coypuOnMethod: Performance >> #muteAll handlerClass: self handlerClass.
	proxySolo := MpMethodProxy coypuOnMethod: Performance >> #solo: handlerClass: self handlerClass.
	proxyPlay := MpMethodProxy coypuOnMethod: Performance >> #play handlerClass: self handlerClass.
	proxyStop := MpMethodProxy coypuOnMethod: Performance >> #stop handlerClass: self handlerClass
]

{ #category : 'api' }
CoypuInstrumenter >> instrument [

	self proxyVariables do: #install
]

{ #category : 'instrumentation' }
CoypuInstrumenter >> proxyVariables [

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
CoypuInstrumenter >> uninstrument [

	self proxyVariables do: #uninstall
]
