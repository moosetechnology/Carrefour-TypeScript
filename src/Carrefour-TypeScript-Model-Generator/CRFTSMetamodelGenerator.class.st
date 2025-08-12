Class {
	#name : 'CRFTSMetamodelGenerator',
	#superclass : 'FamixMetamodelGenerator',
	#instVars : [
		'famixFunction',
		'famixClass',
		'famixEnum',
		'famixInterface',
		'famixStructuralEntity',
		'fastFunctionDeclaration',
		'fastClassDeclaration',
		'fastEnumDeclaration',
		'fastInterfaceDeclaration',
		'fastTypeScriptAssignmentExpression'
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
	famixInterface := self remoteEntity: #Interface withPrefix: #FamixTypeScript.
	
	"FAST"
	
	fastClassDeclaration := self remoteEntity: #ClassDeclaration withPrefix: #FASTTypeScript.	
	fastFunctionDeclaration := self remoteEntity: #FunctionDeclaration withPrefix: #FASTTypeScript.
	fastEnumDeclaration := self remoteEntity: #EnumDeclaration withPrefix: #FASTTypeScript.
	fastInterfaceDeclaration := self remoteEntity: #InterfaceDeclaration withPrefix: #FASTTypeScript.
		

	
]

{ #category : 'definition' }
CRFTSMetamodelGenerator >> defineRelations [

	super defineRelations.
	
	"We have tp think about programbecause it is the top of everything, except when there is an ERROR on top"
	"Declarations on top"
	(famixClass property: #fast) - (fastClassDeclaration property: #famix).
	(famixFunction property: #fast) - (fastFunctionDeclaration property: #famix).
	(famixEnum property: #fast) - (fastEnumDeclaration property: #famix).
	(famixInterface property: #fast) - (fastInterfaceDeclaration property: #famix).
	
	"(famixStructuralEntity property: #fastAssignment) -* (fastTypeScriptAssignmentExpression property: #famixVariable)."
	
]
