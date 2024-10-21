Extension { #name : 'MpMethodProxy' }

{ #category : '*Phizura' }
MpMethodProxy class >> phizuraOnMethod: aMethod handler: aHandlerClass [

	^ self new
		  proxyMethod: aMethod;
		  handler: (aHandlerClass
				   instrumentedMethod: aMethod;
				   yourself);
		  yourself
]
