Class {
	#name : #BaselineOfBDGest,
	#superclass : #BaselineOf,
	#category : #BaselineOfBDGest
}

{ #category : #baselines }
BaselineOfBDGest >> baseline: spec [

	<baseline>
	spec for: #common do: [ 
		spec description: 'BDGest importer'.
		self definePackages: spec.
		self defineDependencies: spec ]
]

{ #category : #baselines }
BaselineOfBDGest >> defineDependencies: spec [

	spec
		baseline: 'XMLParserHTML'
		with: [ spec
				loads: #('default');
				repository: 'github://pharo-contributions/XML-XMLParserHTML/src' ]
]

{ #category : #baselines }
BaselineOfBDGest >> definePackages: spec [

	spec
		repository: 'https://github.com/NicolasAnquetil/BDGest';
		package: 'BDGest' with: [ spec requires: #(XMLParserHTML) ]
]
