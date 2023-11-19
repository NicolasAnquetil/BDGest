"
A specialized `BDGestAbstractVisitor` that extracts the url of the cover picture from an XML subtree
"
Class {
	#name : #BDGestCouvVisitor,
	#superclass : #BDGestAbstractVisitor,
	#instVars : [
		'couverture'
	],
	#category : #'BDGest-Import'
}

{ #category : #accessing }
BDGestCouvVisitor >> couverture [

	^ couverture
]

{ #category : #visiting }
BDGestCouvVisitor >> visitImg: anImgNode [

	^couverture := anImgNode attributeAt: #src
]
