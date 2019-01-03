Class {
	#name : #BaselineOfRecursiveWriteBarrier,
	#superclass : #BaselineOf,
	#category : #BaselineOfRecursiveWriteBarrier
}

{ #category : #baseline }
BaselineOfRecursiveWriteBarrier >> baseline: spec [
	<baseline>
	
	spec for: #common do: [

		spec
			package: 'RecursiveWriteBarrier';
			package: 'BaselineOfRecursiveWriteBarrier'.

].

]
