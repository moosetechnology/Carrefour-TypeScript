Class {
	#name : 'CRFTSMetamodelGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'famixFunction',
		'fastFunctionDeclaration'
	],
	#category : 'Carrefour-TypeScript-Model-Generator',
	#package : 'Carrefour-TypeScript-Model-Generator'
}

{ #category : 'accessing' }
CRFTSMetamodelGenerator class >> packageName [
	<ignoreForCoverage>
	^ 'Carrefour-TypeScript-Model'
]

{ #category : 'accessing' }
CRFTSMetamodelGenerator class >> prefix [
	<ignoreForCoverage>
	^ #CRFTS
]

{ #category : 'accessing' }
CRFTSMetamodelGenerator class >> submetamodels [

	^ { FamixTypeScriptGenerator.
		FASTTypeScriptMetamodelGenerator. }
]

{ #category : 'definition' }
CRFTSMetamodelGenerator >> defineClasses [

	super defineClasses.

	famixFunction := self
		               remoteEntity: #Function
		               withPrefix: #FamixTypeScript.
	fastFunctionDeclaration := self
		               remoteEntity: #FunctionDeclaration
		               withPrefix: #FASTTypeScript.

	
]

{ #category : 'definition' }
CRFTSMetamodelGenerator >> defineRelations [

	super defineRelations.

	(famixFunction property: #fast) - (fastFunctionDeclaration property: #famix).
]
