Class {
	#name : #BDGestAbstractVisitor,
	#superclass : #XMLNodeVisitor,
	#category : #BDGest
}

{ #category : #visiting }
BDGestAbstractVisitor >> visit: aNodeElement withKey: key [

	| selector |
	selector := ('visit' , key capitalized , ':') asSymbol.
	(self class canUnderstand: selector)
		ifTrue: [ ^self perform: selector with: aNodeElement ]
		ifFalse: [ ^super visitElement: aNodeElement ]

]

{ #category : #visiting }
BDGestAbstractVisitor >> visitElement: aNodeElement [

	^self visit: aNodeElement withKey: aNodeElement name

]

{ #category : #visiting }
BDGestAbstractVisitor >> visitSpan: aNodeElement [

	| key |
	key := aNodeElement attributeAt: #class ifAbsent: 'noKey'.
	self visit: aNodeElement withKey: key

]
