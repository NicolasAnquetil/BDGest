"
Represents a BDGestEntry (one book)

Instance variables:
- `couverture` -- the url of the picture of the cover
- `serie` -- name of the serie of books
- `titre` -- title of the book
- `editeur` -- publisher's name
- `depotLegal` -- date of publication
- `auteurs` -- a collection of authors' names
"
Class {
	#name : #BDGestEntry,
	#superclass : #Object,
	#instVars : [
		'couverture',
		'serie',
		'titre',
		'editeur',
		'depotLegal',
		'auteurs'
	],
	#category : #'BDGest-Model'
}

{ #category : #accessing }
BDGestEntry >> auteurs [

	^ auteurs
]

{ #category : #accessing }
BDGestEntry >> auteurs: anObject [

	auteurs := anObject
]

{ #category : #accessing }
BDGestEntry >> couverture [

	^ couverture
]

{ #category : #accessing }
BDGestEntry >> couverture: anObject [

	couverture := anObject
]

{ #category : #accessing }
BDGestEntry >> depotLegal [

	^ depotLegal
]

{ #category : #accessing }
BDGestEntry >> depotLegal: anObject [

	depotLegal := anObject
]

{ #category : #accessing }
BDGestEntry >> editeur [

	^ editeur
]

{ #category : #accessing }
BDGestEntry >> editeur: anObject [

	editeur := anObject
]

{ #category : #accessing }
BDGestEntry >> serie [

	^ serie
]

{ #category : #accessing }
BDGestEntry >> serie: anObject [

	serie := anObject
]

{ #category : #accessing }
BDGestEntry >> titre [

	^ titre
]

{ #category : #accessing }
BDGestEntry >> titre: anObject [

	titre := anObject
]
