# BDGest

A small tool to import BDGest HTML files.

call:
```St
BDGestImport import.
```

Load with :
```St
Metacello new
  baseline: 'BDGest';
  repository: 'github://NicolasAnquetil/BDGest:main/src';
	onWarning: #continue ;
  load.
```
