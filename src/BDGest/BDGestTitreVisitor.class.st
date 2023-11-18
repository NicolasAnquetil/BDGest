Class {
	#name : #BDGestTitreVisitor,
	#superclass : #BDGestAbstractVisitor,
	#instVars : [
		'titre',
		'serie'
	],
	#category : #BDGest
}

{ #category : #accessing }
BDGestTitreVisitor >> serie [

	^ serie
]

{ #category : #accessing }
BDGestTitreVisitor >> titre [

	^titre
		ifNil: [ '' ]
		ifNotNil: [titre contents]
]

{ #category : #visiting }
BDGestTitreVisitor >> visitNuma: aNodeElement [

]

{ #category : #visiting }
BDGestTitreVisitor >> visitSerie: aNodeElement [

	serie := aNodeElement nodes first asString trim
]

{ #category : #visiting }
BDGestTitreVisitor >> visitStringNode: aStringNode [

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
BDGestTitreVisitor >> visitTitre: aNodeElement [

	titre := '' writeStream.
	super visitNodeWithElements: aNodeElement
]
