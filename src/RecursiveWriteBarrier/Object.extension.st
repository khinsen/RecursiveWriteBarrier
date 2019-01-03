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
	| instVars |
	instVars := self class allInstVarNames.
	instVars do: [ :n | (self instVarNamed: n) recursivelySetIsReadOnlyObject: aBoolean ].
	1 to: self basicSize do: [ :i | (self basicAt: i) recursivelySetIsReadOnlyObject: aBoolean ].
	[^self setIsReadOnlyObject: aBoolean] on: PrimitiveFailed do: [ ^self isReadOnlyObject ]

]
