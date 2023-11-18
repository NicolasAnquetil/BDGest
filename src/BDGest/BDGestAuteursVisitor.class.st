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

	auteurs := '' writeStream 
]

{ #category : #visiting }
BDGestAuteursVisitor >> visitA: aNodeElement [

	auteurs
		<< $[ ;
		<< aNodeElement nodes first asString trim ;
		<< $]
]
