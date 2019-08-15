Extension { #name : #CompiledMethod }

{ #category : #'*GToolkit-Demo-Pharo101' }
CompiledMethod >> gtNodesViewFor: aView [
	<gtView>
	| dict |
	dict := Dictionary new.
	self parseTree doSemanticAnalysis allChildren allButFirst do:
		[:aNode |
			(aNode isKindOf: RBSelfNode) ifTrue: [(dict at: 'SelfCalls'
				ifAbsentPut: OrderedCollection new) add: RBSelfNode].
			(aNode isKindOf: RBPragmaNode) ifTrue: [(dict at: 'Pragmas'
				ifAbsentPut: OrderedCollection new) add: RBPragmaNode].
			(aNode isKindOf: RBLiteralValueNode) ifTrue: [(dict at:
				'LiteralValues' ifAbsentPut: OrderedCollection new) add:
					RBLiteralValueNode].
			((aNode isKindOf: RBMessageNode) and: [aNode isUnary]) ifTrue:
				[(dict at: 'UnaryMessages' ifAbsentPut:
					OrderedCollection new) add: RBMessageNode].
			((aNode isKindOf: RBMessageNode) and: [aNode isBinary]) ifTrue:
				[(dict at: 'BinaryMessages' ifAbsentPut: 
					OrderedCollection new) add: RBMessageNode].
			((aNode isKindOf: RBMessageNode) and: [aNode isKeyword]) ifTrue:
				[(dict at: 'KeywordMessages' ifAbsentPut: 
					OrderedCollection new) add: RBMessageNode].
			(aNode isKindOf: RBBlockNode) ifTrue: [(dict at: 'Blocks'
				ifAbsentPut: OrderedCollection new) add: RBBlockNode].
			(aNode isKindOf: RBAssignmentNode) ifTrue: [(dict at:
				'Assignments' ifAbsentPut: OrderedCollection new)
					add: RBAssignmentNode].
			(aNode isKindOf: RBSuperNode) ifTrue: [(dict at: 'SuperCalls'
				ifAbsentPut: OrderedCollection new) add: RBSuperNode].
			(aNode isKindOf: RBLiteralArrayNode) ifTrue: [(dict at:
				'LiteralArrays' ifAbsentPut: OrderedCollection new)
					add: RBLiteralArrayNode].
			(aNode isKindOf: RBCascadeNode) ifTrue: [(dict at: 'Cascades'
				ifAbsentPut: OrderedCollection new) add: RBCascadeNode].
			(aNode isKindOf: RBReturnNode) ifTrue: [(dict at: 'Return'
				ifAbsentPut: OrderedCollection new) add: RBReturnNode].
			((aNode isKindOf: RBVariableNode) and: [ aNode isArg ]) ifTrue:
				[(dict at: 'ArgumentVariables' ifAbsentPut:
					OrderedCollection new) add: RBVariableNode ].
			((aNode isKindOf: RBVariableNode) and: [ aNode isGlobal ])
				ifTrue: [(dict at: 'GlobalVariables' ifAbsentPut: 
					OrderedCollection new) add: RBVariableNode ].
			(((aNode isKindOf: RBVariableNode) and: [ aNode isTemp ])
				and: [ aNode isArg not ]) ifTrue: [(dict at:
					'TemporaryVariables' ifAbsentPut: OrderedCollection new)
						add: RBVariableNode ].
	].
	
	^ aView columnedList
		title: 'Nodes';
		items: [dict associations];
		column: 'Category'
			item: [:each | each key];
		column: 'Elements'
			item: [:each | each value].
]

{ #category : #'*GToolkit-Demo-Pharo101' }
CompiledMethod >> gtTreeCustomViewFor: aView [
	<gtView>
	^ aView tree
		title: 'TreeNodes';
		items: [ {self parseTree} ];
		children: #children.
]

{ #category : #'*GToolkit-Demo-Pharo101' }
CompiledMethod >> gtUnderlineViewFor: aView [
	<gtView>
	| dict |
	dict := Dictionary new.
	self parseTree doSemanticAnalysis allChildren allButFirst do:
		[:aNode |
			(aNode isKindOf: RBSelfNode) ifTrue: [(dict at: 'SelfCalls'
				ifAbsentPut: OrderedCollection new) add: (aNode start)].
			(aNode isKindOf: RBPragmaNode) ifTrue: [(dict at: 'Pragmas'
				ifAbsentPut: OrderedCollection new) add: (aNode left)].
			(aNode isKindOf: RBLiteralValueNode) ifTrue: [(dict at:
				'LiteralValues' ifAbsentPut: OrderedCollection new) add:
					(aNode start)].
			((aNode isKindOf: RBMessageNode) and: [aNode isUnary]) ifTrue:
				[(dict at: 'UnaryMessages' ifAbsentPut:
					OrderedCollection new) add: (aNode keywordsPositions at: 1)].
			((aNode isKindOf: RBMessageNode) and: [aNode isBinary]) ifTrue:
				[(dict at: 'BinaryMessages' ifAbsentPut: 
					OrderedCollection new) add: (aNode keywordsPositions at: 1)].
			((aNode isKindOf: RBMessageNode) and: [aNode isKeyword]) ifTrue:
				[(dict at: 'KeywordMessages' ifAbsentPut: 
					OrderedCollection new) add: (aNode keywordsPositions at: 1)].
			(aNode isKindOf: RBBlockNode) ifTrue: [(dict at: 'Blocks'
				ifAbsentPut: OrderedCollection new) add: (aNode left)].
			(aNode isKindOf: RBAssignmentNode) ifTrue: [(dict at:
				'Assignments' ifAbsentPut: OrderedCollection new)
					add: (aNode assignment)].
			(aNode isKindOf: RBSuperNode) ifTrue: [(dict at: 'SuperCalls'
				ifAbsentPut: OrderedCollection new) add: (aNode start)].
			(aNode isKindOf: RBLiteralArrayNode) ifTrue: [(dict at:
				'LiteralArrays' ifAbsentPut: OrderedCollection new)
					add: (aNode start)].
			(aNode isKindOf: RBCascadeNode) ifTrue: [(dict at: 'Cascades'
				ifAbsentPut: OrderedCollection new) add: (aNode semicolons)].
			(aNode isKindOf: RBReturnNode) ifTrue: [(dict at: 'Return'
				ifAbsentPut: OrderedCollection new) add: (aNode return)].
			((aNode isKindOf: RBVariableNode) and: [ aNode isArg ]) ifTrue:
				[(dict at: 'ArgumentVariables' ifAbsentPut:
					OrderedCollection new) add: (aNode start) ].
			((aNode isKindOf: RBVariableNode) and: [ aNode isGlobal ])
				ifTrue: [(dict at: 'GlobalVariables' ifAbsentPut: 
					OrderedCollection new) add: (aNode start) ].
			(((aNode isKindOf: RBVariableNode) and: [ aNode isTemp ])
				and: [ aNode isArg not ]) ifTrue: [(dict at:
					'TemporaryVariables' ifAbsentPut: OrderedCollection new)
						add: (aNode start) ].
	].
	
	^ aView explicit
		title: 'TestView';
		stencil: [
			| source text editorElement list |
			source := self sourceCode.
			text := source asRopedText.
			(text from: 3 to: 5) attributes: {BlTextUnderlineAttribute new beNotOverwritableByStyler; paint: Color blue}.
			editorElement := BrEditor new
				look: BrGlamorousCodeEditorLook new;
				styler: (BrRBTextStyler new classOrMetaClass: self methodClass);
				text: text.
			"///"
			list := BrColumnedList new
				display: [ 
					(dict associations) 
						sorted: [ :x :y | x name < y name ] ].
			list margin: (BlInsets all: 30).
			list column
				title: 'Elements';
				stencil: [:each | BrColumnCellLabelStencil matchParent: each key].
			"///"
			BlElement new
				layout: BlLinearLayout horizontal;
				constraintsDo: [ :c |
					c horizontal matchParent.
					c vertical matchParent ];
				addChild: (editorElement);
				addChild: (list)
		].
]
