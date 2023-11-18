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
BDGestVisitor >> visitCouv: aNodeElement [

	| visitor |
	visitor := BDGestCouvVisitor new.
	aNodeElement acceptNodeVisitor: visitor.
	self put: visitor couverture toEntryAttribute: #couverture

]

{ #category : #visiting }
BDGestVisitor >> visitSerie: aNodeElement [

	| titre |
	titre := aNodeElement nodes first asString trim.
	self put: titre toEntryAttribute: #serie

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
	visitor := BDGestTitreVisitor new.
	visitor visitNodeWithElements: aNodeElement.

	self put: visitor titre toEntryAttribute: #titre.
	self put: visitor serie toEntryAttribute: #serie

]
