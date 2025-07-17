Class {
	#name : 'CRFTSMetamodelGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'famixMethod',
		'fastEntity'
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

	^ { 
			FamixTypeScriptGenerator
		}
]

{ #category : 'definition' }
CRFTSMetamodelGenerator >> defineClasses [
	super defineClasses.
	
	famixMethod := self remoteEntity: #Method withPrefix: #FamixTypeScript.
	
]

{ #category : 'definition' }
CRFTSMetamodelGenerator >> defineRelations [
	super defineRelations. 
	
	"(famixMethod property: #fast) - (fastEntity property: #famixMethod)."
	
]
