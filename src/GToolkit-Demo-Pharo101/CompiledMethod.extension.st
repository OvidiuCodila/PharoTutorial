Extension { #name : #CompiledMethod }

{ #category : #'*GToolkit-Demo-Pharo101' }
CompiledMethod >> gtNodesViewFor: aView [
	<gtView>
	| dict |
	dict := Dictionary new.
	self parseTree allChildren allButFirst do: [:aNode |
		(aNode isKindOf: RBSelfNode) ifTrue: [(dict at: 'SelfNode'
			ifAbsentPut: OrderedCollection new) add: RBSelfNode].
		(aNode isKindOf: RBPragmaNode) ifTrue: [(dict at: 'PragmaNode'
			ifAbsentPut: OrderedCollection new) add: RBPragmaNode].
		(aNode isKindOf: RBLiteralValueNode) ifTrue: [(dict at:
			'LiteralValueNode' ifAbsentPut: OrderedCollection new) add:
				RBLiteralValueNode].
		((aNode isKindOf: RBMessageNode) and: [aNode isUnary]) ifTrue:
			[(dict at: 'UnaryMessageNode' ifAbsentPut: OrderedCollection new)
				add: RBMessageNode].
		((aNode isKindOf: RBMessageNode) and: [aNode isBinary]) ifTrue:
			[(dict at: 'BinaryMessageNode' ifAbsentPut: 
				OrderedCollection new) add: RBMessageNode].
		((aNode isKindOf: RBMessageNode) and: [aNode isKeyword]) ifTrue:
			[(dict at: 'KeywordMessageNode' ifAbsentPut: 
				OrderedCollection new) add: RBMessageNode].
		(aNode isKindOf: RBBlockNode) ifTrue: [(dict at: 'BlockNode'
			ifAbsentPut: OrderedCollection new) add: RBBlockNode].
		(aNode isKindOf: RBAssignmentNode) ifTrue: [(dict at:
			'AssignmentNode' ifAbsentPut: OrderedCollection new) add:
				RBAssignmentNode].
		(aNode isKindOf: RBSuperNode) ifTrue: [(dict at: 'SuperNode'
			ifAbsentPut: OrderedCollection new) add: RBSuperNode].
		(aNode isKindOf: RBLiteralArrayNode) ifTrue: [(dict at:
			'LiteralArrayNode' ifAbsentPut: OrderedCollection new)
				add: RBLiteralArrayNode].
		(aNode isKindOf: RBCascadeNode) ifTrue: [(dict at: 'CascadeNode'
			ifAbsentPut: OrderedCollection new) add: RBCascadeNode].
		(aNode isKindOf: RBReturnNode) ifTrue: [(dict at: 'ReturnNode'
			ifAbsentPut: OrderedCollection new) add: RBReturnNode].
	].
	^ aView columnedList
		title: 'Nodes';
		items: [dict associations];
		column: 'Name'
			item: [:each | each key];
		column: 'NodesCollection'
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
