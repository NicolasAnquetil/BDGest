"
An abstract visitor on a HTML DOM of the BDGest export of a library

Visits the DOM and allow to specify some nodes that we are interested in
An important method is `visit:withKey:` that takes an XML node and a ""key"", builds a visit method from that key (ex: 'abc' will give '#visitAbc:') and looks if the method exist.
I it exists it is called, if not, the node is visited ""normally""
"
Class {
	#name : #BDGestAbstractVisitor,
	#superclass : #XMLNodeVisitor,
	#category : #'BDGest-Import'
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
