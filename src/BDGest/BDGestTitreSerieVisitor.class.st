"
A specialized `BDGestAbstractVisitor` that extracts the 'title' and 'serie' from an XML subtree
"
Class {
	#name : #BDGestTitreSerieVisitor,
	#superclass : #BDGestAbstractVisitor,
	#instVars : [
		'titre',
		'serie'
	],
	#category : #'BDGest-Import'
}

{ #category : #accessing }
BDGestTitreSerieVisitor >> serie [

	^ serie
]

{ #category : #accessing }
BDGestTitreSerieVisitor >> titre [

	^titre
		ifNil: [ '' ]
		ifNotNil: [titre contents]
]

{ #category : #visiting }
BDGestTitreSerieVisitor >> visitNuma: aNodeElement [

]

{ #category : #visiting }
BDGestTitreSerieVisitor >> visitSerie: aNodeElement [

	serie := aNodeElement nodes first asString trim
]

{ #category : #visiting }
BDGestTitreSerieVisitor >> visitStringNode: aStringNode [

	| string lf |
	titre ifNil: [ ^self ].

	string := aStringNode asString trim.
	lf := string indexOf: Character lf.

	(lf > 0)
		ifTrue: [
			titre
				<< Character space ;
				<< (string copyFrom: lf+1 to: string size) trim
		]
		ifFalse: [ titre << string ]
]

{ #category : #visiting }
BDGestTitreSerieVisitor >> visitTitre: aNodeElement [

	titre := '' writeStream.
	super visitNodeWithElements: aNodeElement
]
