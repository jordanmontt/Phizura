Class {
	#name : 'PhizuraOpenPlaygroundAbstractCommand',
	#superclass : 'StPlaygroundCommand',
	#category : 'Phizura-Playground-Commands',
	#package : 'Phizura-Playground',
	#tag : 'Commands'
}

{ #category : 'executing' }
PhizuraOpenPlaygroundAbstractCommand >> openPhizuraPlaygroundOn: generatedCode [

	(PhizuraPlaygroundPresenter new contents: generatedCode) open
]

{ #category : 'executing' }
PhizuraOpenPlaygroundAbstractCommand >> surroundCodeWithForkBlock: generatedCode [

	| wrappedCode |
	wrappedCode := WriteStream on: String new.
	wrappedCode << $[ << String cr << generatedCode << $] << ' fork.'.
	^ wrappedCode contents
]
