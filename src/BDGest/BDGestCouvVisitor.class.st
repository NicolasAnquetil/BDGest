Class {
	#name : #BDGestCouvVisitor,
	#superclass : #BDGestAbstractVisitor,
	#instVars : [
		'couverture'
	],
	#category : #BDGest
}

{ #category : #accessing }
BDGestCouvVisitor >> couverture [

	^ couverture
]

{ #category : #visiting }
BDGestCouvVisitor >> visitImg: anImgNode [

	^couverture := anImgNode attributeAt: #src
]
