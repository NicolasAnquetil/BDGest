"
A ""collection"" of `BDGestEntry`

API:
- `entries` returns the entries
- `newEntry` creates a new empty entry in the library
"
Class {
	#name : #BDGestLibrary,
	#superclass : #Object,
	#instVars : [
		'entries'
	],
	#category : #'BDGest-Model'
}

{ #category : #accessing }
BDGestLibrary >> entries [

	^ entries
]

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
