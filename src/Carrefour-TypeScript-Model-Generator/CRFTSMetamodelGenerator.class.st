Class {
	#name : 'CRFTSMetamodelGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'famixMethod',
		'fastMethod'
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

	famixMethod := self
		               remoteEntity: #Method
		               withPrefix: #FamixTypeScript.
	fastMethod := self
		               remoteEntity: #MethodDefinition
		               withPrefix: #FASTTypeScript.

	
]

{ #category : 'definition' }
CRFTSMetamodelGenerator >> defineRelations [

	super defineRelations.

	(famixMethod property: #fast) - (fastMethod property: #famix).
]
