Extension { #name : 'MpMethodProxy' }

{ #category : '*Phizura' }
MpMethodProxy class >> phizuraOnMethod: aMethod handlerClass: aHandlerClass [

	^ self new
		  proxyMethod: aMethod;
		  handler: (aHandlerClass new
				   instrumentedMethod: aMethod;
				   yourself);
		  yourself
]
