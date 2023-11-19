Class {
	#name : #BDGestAuteursVisitor,
	#superclass : #BDGestAbstractVisitor,
	#instVars : [
		'auteurs'
	],
	#category : #BDGest
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
