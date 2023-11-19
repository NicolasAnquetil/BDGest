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
		'visitor',
		'library'
	],
	#category : #'BDGest-Import'
}

{ #category : #importing }
BDGestImport class >> import [
	^self new
		import
]

{ #category : #importing }
BDGestImport >> import [

	library := BDGestLibrary new.
	visitor := BDGestVisitor new.
	visitor library: library.

	self importFrom: self sourceDirectory asFileReference.

	^library

]

{ #category : #importing }
BDGestImport >> importFrom: directory [

	| i file |
	i := 1.
	[ file := directory / ('BDGest Online' , i asString , '.html').
	  file exists]
	whileTrue: [
		self importHTML: file.
		i:=i+1
	]

]

{ #category : #importing }
BDGestImport >> importHTML: bdGestHTMLFile [

	| dom |
	dom := bdGestHTMLFile readStreamDo: [ :st | XMLHTMLParser parse: st contents ].
	dom acceptNodeVisitor: visitor
]

{ #category : #accessing }
BDGestImport >> library [

	^ library
]

{ #category : #importing }
BDGestImport >> sourceDirectory [

	^'/home/anquetil/Documents/perso/BDs'

]
