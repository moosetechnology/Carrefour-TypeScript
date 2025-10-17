Class {
	#name : 'CRFTSBinderVisitor',
	#superclass : 'FASTTypeScriptVisitor',
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

{ #category : 'as yet unclassified' }
CRFTSBinderVisitor >> bindFastModel: fastModel fromFamixMethodEntity: aFamixMethodEntity [
	self
		execute: [ self sourceFamixEntity: aFamixMethodEntity.
			fastModel allFASTTypeScriptMethodDefinition 
				 do: [ :methodDeclaration | self accept: methodDeclaration ]. 
			fastModel metamodel: CRFTSModel metamodel ]
		recordedAs: 'Bind ' , aFamixMethodEntity mooseName printString
]

{ #category : 'as yet unclassified' }
CRFTSBinderVisitor >> determineAttributeWithName: aVariableName from: aFASTEntity [

	"I do a lookup for a variable in the famix code with the name = aVariableName 
	 I return the variable if found nil else
	
	It should have only one variable possible for one identifier (if the lookup is done correctly)"
	aVariableName ifNil: [ ^ nil ].
	((aFASTEntity atAnyScope: { 
			  FASTTypeScriptClass .  }) reject: [ :fastElement | 
		 fastElement famixMethod isNil ])
		ifNotEmpty: [ :collectionOfMethods | 
			(collectionOfMethods anyOne famixMethod allAtScope: FamixTMethod) 
				do: [ :aFamixMethod | 
					(self
						 determineAttributeWithName: aVariableName
						 ofFamixMethod: aFamixMethod
						 for: aFASTEntity) ifNotNil: [ :found | ^ found ] ] ]
		ifEmpty: [ "We are in a FASTTypeScriptClassDeclaration (sourceFamixEntity) and in a direct creation
			ifNone it is probably the name of a type... so we do not care
			"
			
			"(self
				 determineAttributeWithName: aVariableName
				 fromFamixEntity:
					 (aFASTEntity atAnyScope: {FASTTypeScriptInterfaceDeclaration . FASTTypeScriptClassDeclaration}) anyOne
						 famixTypeDefinition) ifNotNil: [ :found | ^ found ]."
			
			self sourceFamixEntity accesses 
				detect: [ :access | access variable name = aVariableName ]
				ifFound: [ :access | ^ access  ] ].
	^ nil
]

{ #category : 'as yet unclassified' }
CRFTSBinderVisitor >> determineAttributeWithName: aVariableName fromFamixEntity: aFamixEntity [

	((((aFamixEntity allAtAnyScope: { FamixTClass }) flatCollect:
		   #withSuperclassHierarchy) select: [ :hierarchyElement |
		  hierarchyElement isKindOf: FamixTypeScriptClass ]) sorted: [
		 :classA
		 :classB |
		 classA superclassHierarchy size > classB superclassHierarchy size ])
		ifNotEmpty: [ :scopes |
			scopes do: [ :scope |
				scope attributes
					detect: [ :implicitVariable |
					implicitVariable name = aVariableName ]
					ifFound: [ :found | ^ found ] ] ].
	^ nil
]

{ #category : 'as yet unclassified' }
CRFTSBinderVisitor >> determineAttributeWithName: aVariableName ofFamixMethod: aFamixMethod for: aFastEntity [

	aFamixMethod localVariables
		detect: [ :localVariable | localVariable name = aVariableName ]
		ifFound: [ :found | ^ found ].
	aFamixMethod parameters
		detect: [ :parameter | parameter name = aVariableName ]
		ifFound: [ :found | ^ found ].
	aFamixMethod implicitVariables
		detect: [ :implicitVariable | implicitVariable name = aVariableName ]
		ifFound: [ :found | ^ found ].
	"(aFastEntity allAtScope: FASTTypeScriptClassDeclaration ) do: [ 
		:aFastTypeScriptNewClassExpression | 
		aFastTypeScriptNewClassExpression famixType attributes
			detect: [ :attribute | attribute name = aVariableName ]
			ifFound: [ :found | ^ found ] ]."
 
	(self
		 determineAttributeWithName: aVariableName
		 fromFamixEntity: aFamixMethod) ifNotNil: [ :found | ^ found ].
	^ nil
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
CRFTSBinderVisitor >> visitFASTTypeScriptAssignmentExpression: aFASTTypeScriptAssignmentExpression [

	| attName |
	attName := ((aFASTTypeScriptAssignmentExpression left isKindOf:
		             FASTTypeScriptSubscriptExpression) or: [
		            aFASTTypeScriptAssignmentExpression left isKindOf:
			            FASTTypeScriptMemberExpression ])
		           ifTrue: [
		           aFASTTypeScriptAssignmentExpression left object
			           sourceCode ]
		           ifFalse: [
		           aFASTTypeScriptAssignmentExpression left sourceCode ].

	(self
		 determineAttributeWithName: attName
		 from: aFASTTypeScriptAssignmentExpression) ifNotNil: [
		:structuralEntity |
		structuralEntity fastAssignment: aFASTTypeScriptAssignmentExpression ].

	super visitFASTTypeScriptAssignmentExpression:
		aFASTTypeScriptAssignmentExpression
]

{ #category : 'visiting' }
CRFTSBinderVisitor >> visitFASTTypeScriptClassDeclaration: aFASTTypeScriptClassDeclaration [

	| collector famixClass |
	"1- Filter classes in famixSourceEntity (if famixSourceEntity itself is not a class) and find the correspondant famixClass"
	collector := CRFTSBinderCollector new.
	famixClass := collector
		              collectClass:
		              aFASTTypeScriptClassDeclaration name sourceCode
		              from: self sourceFamixEntity.

	"2- link the fastClassDeclaration to the found famix class"

	famixClass ifNotNil: [
		aFASTTypeScriptClassDeclaration famix: famixClass ].

	"3- Link my entities"
	"Class entities are: body and name; I don't find a reason for linking them. For sure we have to link what we find inside ClassBody: fields, methods ..."

	"4- Visit the rest of the tree "
	super visitFASTTypeScriptClassDeclaration:
		aFASTTypeScriptClassDeclaration
]

{ #category : 'visiting' }
CRFTSBinderVisitor >> visitFASTTypeScriptEnumDeclaration: aFASTTypeScriptEnumDeclaration [
	
	| collector famixEnum |
	"1- Filter Enums in famixSourceEntity (if famixSourceEntity itself is not an enum) and find the correspondant famixEnum"
	
	collector := CRFTSBinderCollector new.
	famixEnum := collector
		              collectEnum:
		              aFASTTypeScriptEnumDeclaration name sourceCode
		              from: self sourceFamixEntity.
		
	"2- link the fastEnumDeclaration to the found famix enum"

	famixEnum ifNotNil: [
		aFASTTypeScriptEnumDeclaration famix: famixEnum ].
	
	"3- Link my entities"
	"Enum entities are: body and name; I don't find a reason for linking them. For sure we have to link what we find inside EnumBody: propertyIdentifier"

   "4- Visit the rest of the tree "
	super visitFASTTypeScriptEnumDeclaration:
		aFASTTypeScriptEnumDeclaration
]

{ #category : 'visiting' }
CRFTSBinderVisitor >> visitFASTTypeScriptFunctionDeclaration: aFASTTypeScriptFunctionDeclaration [
	
	| collector famixFunction |
	"1- Filter functions in famixSourceEntity (if famixSourceEntity itself is not a function) and find the correspondant famixFunction"
	collector := CRFTSBinderCollector new.
	famixFunction := collector
		              collectFunction:
		              aFASTTypeScriptFunctionDeclaration name sourceCode
		              from: self sourceFamixEntity. 
		
	"2- link the fastFunctionDeclaration to the found famix function"
	famixFunction ifNotNil: [
		aFASTTypeScriptFunctionDeclaration famix: famixFunction ]. 
	 
	"3- Link my entities"
	"Function entities are: body, name, parameters and return_type; I think what should be linked is what is inside the body (and perhaps parametrs ? not sure ... upcoming days will show us"

	"4- Visit the rest of the tree "
	super visitFASTTypeScriptFunctionDeclaration:
		aFASTTypeScriptFunctionDeclaration
]

{ #category : 'visiting' }
CRFTSBinderVisitor >> visitFASTTypeScriptInterfaceDeclaration: aFASTTypeScriptInterfaceDeclaration [

	| collector famixInterface |
	"1- Filter interfaces in famixSourceEntity (if famixSourceEntity itself is not an interface) and find the correspondant famixInterface"
	collector := CRFTSBinderCollector new.
	famixInterface := collector
		                  collectInterface:
		                  aFASTTypeScriptInterfaceDeclaration name
			                  sourceCode
		                  from: self sourceFamixEntity.
	
	"2- link the famixInterface to the found famix interface"

	famixInterface ifNotNil: [
		aFASTTypeScriptInterfaceDeclaration famix: famixInterface ].	
	
	"3- Link my entities"
	"Interface entities are: body and name; I don't find a reason for linking them. perhaps we have to link what we find inside InterfaceBody ..."

	"4- Visit the rest of the tree "
	super visitFASTTypeScriptInterfaceDeclaration:
		aFASTTypeScriptInterfaceDeclaration.
]

{ #category : 'visiting' }
CRFTSBinderVisitor >> visitFASTTypeScriptMethodDefinition: aFASTTypeScriptMethodDefinition [
	"check if something on top pf it? Normally there is Program.
	For example check Java"

	((self sourceFamixEntity allToScope: FamixTMethod) select: [ :method |
		 method name = aFASTTypeScriptMethodDefinition name sourceCode and: [
			 method hasSourceAnchor and: [
				 method sourceAnchor startPos
				 = aFASTTypeScriptMethodDefinition startPos ] ] ]) ifNotEmpty: [
		:methodsWithCorrectName |
		methodsWithCorrectName asOrderedCollection first fast:
			aFASTTypeScriptMethodDefinition ].

	"this needs more elaboration: perhaps a visitor is required for the FASTTypeScriptRequiredParameter which is the type for genericChildren"
	"aFASTTypeScriptClassDeclaration parameters genericChildren do: [ :children | self accept: children ]."

	"aFASTTypeScriptMethodDefinition body allChildren  do: [ :children | self accept: children ]."
	
	super visitFASTTypeScriptMethodDefinition:
		aFASTTypeScriptMethodDefinition
]
