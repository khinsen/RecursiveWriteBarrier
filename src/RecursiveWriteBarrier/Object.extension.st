Extension { #name : #Object }

{ #category : #'*RecursiveWriteBarrier' }
Object >> beRecursivelyReadOnlyObject [
	^self recursivelySetIsReadOnlyObject: true
]

{ #category : #'*RecursiveWriteBarrier' }
Object >> beRecursivelyWritableObject [
	^self recursivelySetIsReadOnlyObject: false
]

{ #category : #'*RecursiveWriteBarrier' }
Object >> recursivelySetIsReadOnlyObject: aBoolean [
 	self recursivelySetIsReadOnlyObject: aBoolean exceptObjectsIn: IdentitySet new.

]

{ #category : #'*RecursiveWriteBarrier' }
Object >> recursivelySetIsReadOnlyObject: aBoolean exceptObjectsIn: alreadyDone [
	| instVars  |
	"Handle self if not already done, and note it as done."
	(alreadyDone includes: self) ifFalse:
		[	[^self setIsReadOnlyObject: aBoolean] on: PrimitiveFailed do: [ ^self isReadOnlyObject ].
			alreadyDone add: self ].
	instVars := self class allInstVarNames.
	"Handle all instance vars of self."
	instVars do: [ :n | (self instVarNamed: n) recursivelySetIsReadOnlyObject: aBoolean
															exceptObjectsIn: alreadyDone ].
	"Handle all indexed elements of self."
	1 to: self basicSize do: [ :i | (self basicAt: i) recursivelySetIsReadOnlyObject: aBoolean
																	 exceptObjectsIn: alreadyDone ].

]
