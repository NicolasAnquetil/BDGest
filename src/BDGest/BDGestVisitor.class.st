Class {
	#name : #BDGestVisitor,
	#superclass : #BDGestAbstractVisitor,
	#instVars : [
		'currentEntry',
		'library'
	],
	#category : #BDGest
}

{ #category : #accessing }
BDGestVisitor >> entryFor: key [

	currentEntry ifNil: [ ^self newEntry ].
	(currentEntry perform: key)  ifNotNil: [ ^self newEntry ].
	^currentEntry
]

{ #category : #accessing }
BDGestVisitor >> library [

	^ library
]

{ #category : #accessing }
BDGestVisitor >> library: anObject [

	library := anObject
]

{ #category : #accessing }
BDGestVisitor >> newEntry [
	^currentEntry := library newEntry
]

{ #category : #visiting }
BDGestVisitor >> put: value toEntryAttribute: getter [

	| setter |
	setter := (getter asString , ':') asSymbol.
	(self entryFor: getter)
		perform: setter with: value

]

{ #category : #visiting }
BDGestVisitor >> visitAuteurs: aNodeElement [

	| visitor |
	visitor := BDGestAuteursVisitor new.
	aNodeElement acceptNodeVisitor: visitor.
	self put: visitor auteurs toEntryAttribute: #auteurs

]

{ #category : #visiting }
BDGestVisitor >> visitCouv: aNodeElement [

	| visitor |
	visitor := BDGestCouvVisitor new.
	aNodeElement acceptNodeVisitor: visitor.
	self put: visitor couverture toEntryAttribute: #couverture

]

{ #category : #visiting }
BDGestVisitor >> visitDiv: aNodeElement [

	self visit: aNodeElement withKey: (aNodeElement attributeAt: #class ifAbsent: #noKey)
]

{ #category : #visiting }
BDGestVisitor >> visitDl: aNodeElement [

	| depotLegal |
	((aNodeElement attributeAt: 'title') = 'Dépot légal')
		ifFalse: [ ^self ].

	depotLegal := aNodeElement nodes first asString trim.
	(depotLegal = '00/0000')
		ifTrue: [ depotLegal := '' ].
	self put: depotLegal toEntryAttribute: #depotLegal

]

{ #category : #visiting }
BDGestVisitor >> visitEditeur: aNodeElement [

	| editeur |
	editeur := aNodeElement nodes first asString trim.
	self put: editeur toEntryAttribute: #editeur

]

{ #category : #visiting }
BDGestVisitor >> visitTd: aNodeElement [

	| key |
	key := (Character space
		split: (aNodeElement attributeAt: #class ifAbsent: 'noKey noKey'))
		first.
	
	self visit: aNodeElement withKey: key
]

{ #category : #visiting }
BDGestVisitor >> visitTdc: aNodeElement [

	| key |
	key := (Character space
		split: (aNodeElement attributeAt: #class ifAbsent: 'noKey noKey'))
		second.
	
	self visit: aNodeElement withKey: key
]

{ #category : #visiting }
BDGestVisitor >> visitTitre: aNodeElement [


	| visitor |
	visitor := BDGestTitreSerieVisitor new.
	visitor visitNodeWithElements: aNodeElement.

	self put: visitor titre toEntryAttribute: #titre.
	self put: visitor serie toEntryAttribute: #serie

]
