Class {
	#name : 'CRFTSBinderCleaner',
	#superclass : 'FASTTypeScriptVisitor',
	#category : 'Carrefour-TypeScript-FastAndBindingGenerator',
	#package : 'Carrefour-TypeScript-FastAndBindingGenerator'
}

{ #category : 'as yet unclassified' }
CRFTSBinderCleaner >> fullClean: anEntity [

	"remove this entity, the top entities, all the FAST model"

	| mooseModel |
	mooseModel := anEntity mooseModel.
	mooseModel flushPrivateState.
	mooseModel flush.
	self accept: anEntity.
	mooseModel removeAll
]

{ #category : 'visiting' }
CRFTSBinderCleaner >> visitFASTTypeScriptAssignmentExpression: aFASTTypeScriptAssignmentExpression [
	aFASTTypeScriptAssignmentExpression famixVariable: nil.
	^ super visitFASTTypeScriptAssignmentExpression: aFASTTypeScriptAssignmentExpression
]

{ #category : 'visiting' }
CRFTSBinderCleaner >> visitFASTTypeScriptClassDeclaration: aFASTTypeScriptClassDeclaration [
 
	aFASTTypeScriptClassDeclaration famix: nil.
	^ super visitFASTTypeScriptClassDeclaration: aFASTTypeScriptClassDeclaration
]

{ #category : 'visiting' }
CRFTSBinderCleaner >> visitFASTTypeScriptEnumDeclaration: aFASTTypeScriptEnumDeclaration [
 
	aFASTTypeScriptEnumDeclaration famix: nil.
	^ super visitFASTTypeScriptEnumDeclaration: aFASTTypeScriptEnumDeclaration
]

{ #category : 'visiting' }
CRFTSBinderCleaner >> visitFASTTypeScriptFunctionDeclaration: aFASTTypeScriptFunctionDeclaration [
	aFASTTypeScriptFunctionDeclaration famix: nil.
	^ super visitFASTTypeScriptFunctionDeclaration: aFASTTypeScriptFunctionDeclaration
]

{ #category : 'visiting' }
CRFTSBinderCleaner >> visitFASTTypeScriptInterfaceDeclaration: aFASTTypeScriptInterfaceDeclaration [
	aFASTTypeScriptInterfaceDeclaration famix: nil.
		
	self flag: 'to be changed'.
	^ super visitFASTTEntity: aFASTTypeScriptInterfaceDeclaration.
	"^ super visitFASTTypeScriptInterfaceDeclaration: aFASTTypeScriptInterfaceDeclaration"
]

{ #category : 'visiting' }
CRFTSBinderCleaner >> visitFASTTypeScriptMethodDefinition: aFASTTypeScriptMethodDefinition [
	aFASTTypeScriptMethodDefinition famix: nil. 
	^ super visitFASTTypeScriptMethodDefinition: aFASTTypeScriptMethodDefinition. 
]
