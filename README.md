# BDGest

A small tool to import BDGest HTML files.

call:
```St
BDGestImport import.
```

requires XMLParserHTML :
```St
Metacello new
	baseline: 'XMLParserHTML';
	repository: 'github://pharo-contributions/XML-XMLParserHTML/src';
	load.
```
