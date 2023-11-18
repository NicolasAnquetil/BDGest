"
requires XML-HTMLParser

Metacello new
	baseline: 'XMLParserHTML';
	repository: 'github://pharo-contributions/XML-XMLParserHTML/src';
	load.
"
Class {
	#name : #BDGestImport,
	#superclass : #Object,
	#instVars : [
		'visitor'
	],
	#category : #BDGest
}

{ #category : #importing }
BDGestImport >> import [

	visitor := BDGestVisitor new.
	self importFrom: '/home/anquetil/Documents/perso/BDs' asFileReference.

]

{ #category : #importing }
BDGestImport >> importFrom: directory [

	| i file |
	i := 1.
	[file := directory / ('BDGest Online' , i asString , '.html').
	file exists]
	whileTrue: [
		self importHTML: file
	]

]

{ #category : #importing }
BDGestImport >> importHTML: bdGestHTMLFile [

	| dom |
	dom := bdGestHTMLFile readStreamDo: [ :st | XMLHTMLParser parse: st contents ].
	dom acceptNodeVisitor: visitor
]
