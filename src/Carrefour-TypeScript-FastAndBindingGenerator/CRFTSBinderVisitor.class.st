Class {
	#name : 'CRFTSBinderVisitor',
	#superclass : 'FASTCoreVisitor',
	#instVars : [
		'sourceFamixEntity'
	],
	#category : 'Carrefour-TypeScript-FastAndBindingGenerator',
	#package : 'Carrefour-TypeScript-FastAndBindingGenerator'
}

{ #category : 'as yet unclassified' }
CRFTSBinderVisitor >> bindFastModel: fastModel fromFamixClassEntity: aFamixClassEntity [
	self
		execute: [ self sourceFamixEntity: aFamixClassEntity.
			fastModel allFASTTypeScriptClassDeclaration
				"In Java there is a check here to see if there is a parent for the function; I don't see whe we need it here."
				 do: [ :classDeclaration | self accept: classDeclaration ]. 
			fastModel metamodel: CRFTSModel metamodel ]
		recordedAs: 'Bind ' , aFamixClassEntity mooseName printString
]

{ #category : 'as yet unclassified' }
CRFTSBinderVisitor >> bindFastModel: fastModel fromFamixEnumEntity: aFamixEnumEntity [
	self
		execute: [ self sourceFamixEntity: aFamixEnumEntity.
			fastModel allFASTTypeScriptEnumDeclaration 
				"In Java there is a check here to see if there is a parent for the function; I don't see whe we need it here."
				 do: [ :enumDeclaration | self accept: enumDeclaration ]. 
			fastModel metamodel: CRFTSModel metamodel ]
		recordedAs: 'Bind ' , aFamixEnumEntity mooseName printString
]

{ #category : 'as yet unclassified' }
CRFTSBinderVisitor >> bindFastModel: fastModel fromFamixFunctionEntity: aFamixFunctionEntity [
	self
		execute: [ self sourceFamixEntity: aFamixFunctionEntity.
			fastModel allFASTTypeScriptFunctionDeclaration 
				"In Java there is a check here to see if there is a parent for the function; I don't see whe we need it here."
				 do: [ :functionDeclaration | self accept: functionDeclaration ]. 
			fastModel metamodel: CRFTSModel metamodel ]
		recordedAs: 'Bind ' , aFamixFunctionEntity mooseName printString
]

{ #category : 'as yet unclassified' }
CRFTSBinderVisitor >> bindFastModel: fastModel fromFamixInteraceEntity: aFamixInterfaceEntity [
	self
		execute: [ self sourceFamixEntity: aFamixInterfaceEntity.
			fastModel allFASTTypeScriptInterfaceDeclaration 
				"In Java there is a check here to see if there is a parent for the function; I don't see whe we need it here."
				 do: [ :interfaceDeclaration | self accept: interfaceDeclaration ]. 
			fastModel metamodel: CRFTSModel metamodel ]
		recordedAs: 'Bind ' , aFamixInterfaceEntity mooseName printString

	
]

{ #category : 'accessing' }
CRFTSBinderVisitor >> sourceFamixEntity [

	^ sourceFamixEntity
]

{ #category : 'accessing' }
CRFTSBinderVisitor >> sourceFamixEntity: anObject [

	sourceFamixEntity := anObject
]

{ #category : 'visiting' }
CRFTSBinderVisitor >> visitFASTTypeScriptClassDeclaration: aFASTTypeScriptClassDeclaration [
  
	"check if something on top pf it? Normally there is Program.
	For example check Java"

	self sourceFamixEntity fast: aFASTTypeScriptClassDeclaration.
	"this needs more elaboration: perhaps a visitor is required for the FASTTypeScriptRequiredParameter which is the type for genericChildren"
	"aFASTTypeScriptClassDeclaration parameters genericChildren do: [ :children | self accept: children ]."
]

{ #category : 'visiting' }
CRFTSBinderVisitor >> visitFASTTypeScriptEnumDeclaration: aFASTTypeScriptEnumDeclaration [
  
	"check if something on top pf it? Normally there is Program.
	For example check Java"

	self sourceFamixEntity fast: aFASTTypeScriptEnumDeclaration.
	"this needs more elaboration: perhaps a visitor is required for the FASTTypeScriptRequiredParameter which is the type for genericChildren"
	"aFASTTypeScriptClassDeclaration parameters genericChildren do: [ :children | self accept: children ]."
]

{ #category : 'visiting' }
CRFTSBinderVisitor >> visitFASTTypeScriptFunctionDeclaration: aFASTTypeScriptFunctionDeclaration [
  
	"check if something on top pf it? Normally there is Program.
	For example check Java"

	self sourceFamixEntity fast: aFASTTypeScriptFunctionDeclaration.
	"this needs more elaboration: perhaps a visitor is required for the FASTTypeScriptRequiredParameter which is the type for genericChildren"
	aFASTTypeScriptFunctionDeclaration parameters genericChildren do: [ :children | self accept: children ].
]

{ #category : 'visiting' }
CRFTSBinderVisitor >> visitFASTTypeScriptInterfaceDeclaration: aFASTTypeScriptInterfaceDeclaration [
  
	"check if something on top pf it? Normally there is Program.
	For example check Java"

	self sourceFamixEntity fast: aFASTTypeScriptInterfaceDeclaration.
	"this needs more elaboration: perhaps a visitor is required for the FASTTypeScriptRequiredParameter which is the type for genericChildren"
	"aFASTTypeScriptClassDeclaration parameters genericChildren do: [ :children | self accept: children ]."
]
