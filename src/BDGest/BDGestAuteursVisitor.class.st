"
A specialized `BDGestAbstractVisitor` that extracts the names of auteurs in a list of string from an XML subtree
"
Class {
	#name : #BDGestAuteursVisitor,
	#superclass : #BDGestAbstractVisitor,
	#instVars : [
		'auteurs'
	],
	#category : #'BDGest-Import'
}

{ #category : #accessing }
BDGestAuteursVisitor >> auteurs [

	^ auteurs contents
]

{ #category : #initialization }
BDGestAuteursVisitor >> initialize [

	super initialize.

	auteurs := OrderedCollection new
]

{ #category : #visiting }
BDGestAuteursVisitor >> visitA: aNodeElement [

	auteurs add: aNodeElement nodes first asString trim
]
