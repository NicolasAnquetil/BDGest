Class {
	#name : #BDGestLibrary,
	#superclass : #Object,
	#instVars : [
		'entries'
	],
	#category : #BDGest
}

{ #category : #initialization }
BDGestLibrary >> initialize [ 

	super initialize.

	entries := OrderedCollection new
]

{ #category : #'instance creation' }
BDGestLibrary >> newEntry [

	| entry |
	entry := BDGestEntry new.
	entries add: entry.
	^entry
]
