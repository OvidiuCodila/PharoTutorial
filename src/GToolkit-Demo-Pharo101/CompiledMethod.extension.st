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
	| dict startPos |
	dict := Dictionary new.
	self parseTree doSemanticAnalysis allChildren allButFirst do:
		[:aNode |
			(aNode isKindOf: RBSelfNode) ifTrue: [
				startPos := aNode start.
				(dict at: 'SelfCalls' ifAbsentPut: OrderedCollection new)
					add: (startPos -> (startPos + aNode name byteSize - 1))].
			(aNode isKindOf: RBPragmaNode) ifTrue: [
				(dict at: 'Pragmas' ifAbsentPut: OrderedCollection new)
					add: (aNode left -> aNode right)].
			(aNode isKindOf: RBLiteralValueNode) ifTrue: [
				(dict at: 'LiteralValues' ifAbsentPut: OrderedCollection new)
					add: (aNode start -> aNode stop)].
			((aNode isKindOf: RBMessageNode) and: [aNode isUnary]) ifTrue: [
				startPos := aNode keywordsPositions at: 1.
				(dict at: 'UnaryMessages' ifAbsentPut: OrderedCollection new)
					add: (startPos -> (startPos + aNode selector byteSize - 1))].
			((aNode isKindOf: RBMessageNode) and: [aNode isBinary]) ifTrue: [
				startPos := aNode keywordsPositions at: 1.
				(dict at: 'BinaryMessages' ifAbsentPut: OrderedCollection new)
					add: (startPos -> (startPos + aNode selector byteSize - 1))].
			((aNode isKindOf: RBMessageNode) and: [aNode isKeyword]) ifTrue: [
				| selectors positions currentSelector|
				selectors := aNode selectorParts.
				positions := aNode keywordsPositions.
				1 to: (selectors size) do: [:anIndex |
					currentSelector := selectors at: anIndex.
					startPos := positions at: anIndex.
					(dict at: 'KeywordMessages' ifAbsentPut: OrderedCollection new)
						add: (startPos -> (startPos + currentSelector byteSize - 1))]].
			(aNode isKindOf: RBBlockNode) ifTrue: [
				(dict at: 'Blocks' ifAbsentPut: OrderedCollection new)
					add: (aNode left -> aNode right)].
			(aNode isKindOf: RBAssignmentNode) ifTrue: [
				startPos := aNode assignment.
				(dict at: 'Assignments' ifAbsentPut: OrderedCollection new)
					add: (startPos -> (startPos + 1))].
			(aNode isKindOf: RBSuperNode) ifTrue: [
				startPos := aNode start.
				(dict at: 'SuperCalls' ifAbsentPut: OrderedCollection new)
					add: (startPos -> (startPos + aNode name byteSize - 1))].
			(aNode isKindOf: RBLiteralArrayNode) ifTrue: [(dict at:
				'LiteralArrays' ifAbsentPut: OrderedCollection new)
					add: (aNode start -> aNode stop)].
			(aNode isKindOf: RBCascadeNode) ifTrue: [
				startPos := aNode semicolons at: 1.
				(dict at: 'Cascades' ifAbsentPut: OrderedCollection new)
					add: (startPos -> startPos)].
			(aNode isKindOf: RBReturnNode) ifTrue: [(dict at: 'Return'
				ifAbsentPut: OrderedCollection new)
					add: (aNode return -> aNode return)].
			((aNode isKindOf: RBVariableNode) and: [ aNode isArg ]) ifTrue: [
				startPos := aNode start.
				(dict at: 'ArgumentVariables' ifAbsentPut: OrderedCollection new)
					add: (startPos -> (startPos + aNode name byteSize - 1)) ].
			((aNode isKindOf: RBVariableNode) and: [ aNode isGlobal ]) ifTrue: [
				startPos := aNode start.
				(dict at: 'GlobalVariables' ifAbsentPut: OrderedCollection new)
					add: (startPos -> (startPos + aNode name byteSize - 1)) ].
			(((aNode isKindOf: RBVariableNode) and: [ aNode isTemp ])
				and: [ aNode isArg not ]) ifTrue: [
					startPos := aNode start.
					(dict at: 'TemporaryVariables' ifAbsentPut: OrderedCollection new)
						add: (startPos -> (startPos + aNode name byteSize - 1)) ].
	].
	
	^ aView explicit
		title: 'TestView';
		stencil: [
			| source text editorElement list k z h|
			source := self sourceCode.
			text := source asRopedText.
			"(text from: 3 to: 5) attributes: {BlTextUnderlineAttribute new beNotOverwritableByStyler; paint: Color blue}."
			editorElement := BrEditor new
				look: BrGlamorousCodeEditorLook new;
				styler: (BrRBTextStyler new classOrMetaClass: self methodClass);
				text: text.
			"///"
			list := BrColumnedList new.
			list items: (dict associations).
				"display: [ 
					(dict associations) 
						sorted: [ :x :y | x name < y name ] ]."
			list when: BrSelectionChanged do: [:selectedEvent | 
				k := selectedEvent selectedInterval.
				(k isNil) ifFalse: [
					text attributes: {BlTextUnderlineAttribute new beNotOverwritableByStyler; paint: Color white}.
					h := k at: 1.
					z := ((dict associations at: h) value).
					z do: [:anAssoc |
						(text from: (anAssoc key) to: (anAssoc value)) attributes: {BlTextUnderlineAttribute new beNotOverwritableByStyler; paint: Color blue} ].
					editorElement text: text]
				].
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
				addChild: (BlElement new 
					look: BrShadowLook; 
					background: Color white;
					margin: (BlInsets all: 20);
					size: 500@500;
					addChild: editorElement);
				addChild: (BlElement new
					constraintsDo: [ :c |
						c linear horizontal alignCenter.
						c vertical fitContent ];
					look: BrShadowLook; 
					background: Color white;
					margin: (BlInsets all: 20);
					padding: (BlInsets all: 20);
					size: 500@500;
					addChild: list).
		].
]
