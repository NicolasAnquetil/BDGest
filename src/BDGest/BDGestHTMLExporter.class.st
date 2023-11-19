Class {
	#name : #BDGestHTMLExporter,
	#superclass : #Object,
	#category : #BDGest
}

{ #category : #'as yet unclassified' }
BDGestHTMLExporter >> afterText: st [

	st
		<< '</font><br>' ;
		cr
]

{ #category : #'as yet unclassified' }
BDGestHTMLExporter >> beforeText: st [

	st << '<font size="4" style="font-size: 16pt">'
]

{ #category : #'as yet unclassified' }
BDGestHTMLExporter >> export: bdGestLibrary to: filename [

	| first |

	filename asFileReference writeStreamDo: [ :st |
		self headerOn: st.
		first := true.
		bdGestLibrary entries
			do: [ :entry |
				self exportEntry: entry on: st firstColumn: first.
				first := first not
			].
		self footerOn: st
	]
]

{ #category : #'as yet unclassified' }
BDGestHTMLExporter >> exportEntry: aBDGestEntry on: st firstColumn: isFirst [

	isFirst ifTrue: [ st << '<tr>' ; lf ].

	st << '<td>'.
	self exportEntryCouverture: aBDGestEntry on: st.
	st << '</td><td>'.
	self exportEntrySerie: aBDGestEntry on: st.
	self exportEntryTitre: aBDGestEntry on: st.
	self exportEntryEditeur: aBDGestEntry on: st.
	self exportEntryDepotLegal: aBDGestEntry on: st.
	self exportEntryAuteurs: aBDGestEntry on: st.
	st << '</td>'.

	isFirst ifFalse: [ st << '</tr' ; lf ]
]

{ #category : #'as yet unclassified' }
BDGestHTMLExporter >> exportEntryAuteurs: aBDGestEntry on: st [

	self beforeText: st.
	aBDGestEntry auteurs do: [ :auteur |
		st
			<< $[ ;
			<< auteur ;
			<< $]
	].
	self afterText: st
]

{ #category : #'as yet unclassified' }
BDGestHTMLExporter >> exportEntryCouverture: aBDGestEntry on: st [

	st
		<< '<img src="' ;
		<< aBDGestEntry couverture ;
		<< '" align="left" width="117" height="157" border="0"/>' ;
		lf
]

{ #category : #'as yet unclassified' }
BDGestHTMLExporter >> exportEntryDepotLegal: aBDGestEntry on: st [

	self beforeText: st.
	st
		<< aBDGestEntry depotLegal.
	self afterText: st
]

{ #category : #'as yet unclassified' }
BDGestHTMLExporter >> exportEntryEditeur: aBDGestEntry on: st [

	self beforeText: st.
	st
		<< aBDGestEntry editeur.
	self afterText: st
]

{ #category : #'as yet unclassified' }
BDGestHTMLExporter >> exportEntrySerie: aBDGestEntry on: st [

	self beforeText: st.
	st
		<< '<b>' ;
		<< aBDGestEntry serie ;
		<< '</b>'.
	self afterText: st
]

{ #category : #'as yet unclassified' }
BDGestHTMLExporter >> exportEntryTitre: aBDGestEntry on: st [

	self beforeText: st.
	st
		<< aBDGestEntry titre.
	self afterText: st
]

{ #category : #'as yet unclassified' }
BDGestHTMLExporter >> footerOn: st [

	st << '</table></body></html>'
]

{ #category : #'as yet unclassified' }
BDGestHTMLExporter >> headerOn: st [
	st << '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8"/>
	<title></title>
	<meta name="generator" content="BDGestHTMLExporter" />
	<style type="text/css">
		@page { margin: 0.79in }
		p { margin-bottom: 0.1in; line-height: 120% }
		a:link { so-language: zxx }
	</style>
</head>
<body lang="en-US" dir="ltr">
<table>'
]