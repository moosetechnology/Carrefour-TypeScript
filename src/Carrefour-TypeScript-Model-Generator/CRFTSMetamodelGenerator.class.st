Class {
	#name : 'CRFTSMetamodelGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'famixFunction',
		'famixClass',
		'famixEnum',
		'fastFunctionDeclaration',
		'fastClassDeclaration',
		'fastEnumDeclaration'
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

	"Famix"
	
	famixClass := self remoteEntity: #Class withPrefix: #FamixTypeScript.	
	famixFunction := self remoteEntity: #Function withPrefix: #FamixTypeScript.
	famixEnum := self remoteEntity: #Enum withPrefix: #FamixTypeScript.
	
	"FAST"
	
	fastClassDeclaration := self remoteEntity: #ClassDeclaration withPrefix: #FASTTypeScript.	
	fastFunctionDeclaration := self remoteEntity: #FunctionDeclaration withPrefix: #FASTTypeScript.
	fastEnumDeclaration := self remoteEntity: #EnumDeclaration withPrefix: #FASTTypeScript.

	
]

{ #category : 'definition' }
CRFTSMetamodelGenerator >> defineRelations [

	super defineRelations.

	(famixClass property: #fast) - (fastClassDeclaration property: #famix).
	(famixFunction property: #fast) - (fastFunctionDeclaration property: #famix).
	(famixEnum property: #fast) - (fastEnumDeclaration property: #famix).
]
