"
I am a tutorial for the beginners.
"
Class {
	#name : #PharoTutorial,
	#superclass : #Object,
	#category : #'Tutorial-PharoForBeginners'
}

{ #category : #adding }
PharoTutorial >> addArraysSlidesIn: aSlider [
	| firstExamplesBook secondExamplesBook |
	firstExamplesBook := self createBookFrom: {'#(1 2 3).'. '#(1 2 3 #(4 5 6)) size.'. '#() isEmpty.'.}.
	secondExamplesBook := self createBookFrom: 
		{'#(1 2 3) first.'. '#(4 5 6) last.'. '#(''hello'' ''World'') at: 2 put: ''Pharo''; yourself.'}.
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Arrays';
		firstText: 'Literal Arrays are created at parse time').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Array Examples';
		element: (GtInspector createOnPlayBook: firstExamplesBook)).
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'More Array Examples';
		element: (GtInspector createOnPlayBook: secondExamplesBook)).
]

{ #category : #adding }
PharoTutorial >> addBasicTypesSlidesIn: aSlider [
	aSlider addNewSlide: (GtTitleSlide new
				titleText: ('Pharo101' asRopedText fontSize: 70);
				subtitleText: ('Basic types' asRopedText fontSize:50; foreground: Color gray)).
	self addNumbersSlidesIn: aSlider.
	self addCharactersSlidesIn: aSlider.
	self addStringsSlidesIn: aSlider.
	self addSymbolsSlidesIn: aSlider.
	self addArraysSlidesIn: aSlider.
	self addDynamicArraysSlidesIn: aSlider.
]

{ #category : #adding }
PharoTutorial >> addBinaryMessagesSlidesIn: aSlider [
	| firstBinaryExamplesBook secondBinaryExamplesBook |
	firstBinaryExamplesBook := self createBookFrom: {'3*2.'. 'Date today + 3 weeks.'. 'true & false.'}.
	secondBinaryExamplesBook := self createBookFrom: {'10 @ 10.'. '10 <= 12.'. '''ab'',''cd''.'}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Binary Messages';
		firstText: 'They have the following form: anObject aMessage anotherObject';
		secondText: 'And they are always operands like: +, *, &, |').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Binary Messages Examples';
		element: (GtInspector createOnPlayBook: firstBinaryExamplesBook)).
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'More Binary Messages Examples';
		element: (GtInspector createOnPlayBook: secondBinaryExamplesBook)).
]

{ #category : #adding }
PharoTutorial >> addBlockAssignationSlidesIn: aSlider [
	| aBook codeExample |
	codeExample := 'x := [:a | a + 2].', Character cr asString,'x value:12.'.
	aBook := self createBookFrom: {codeExample}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Blocks Assignation';
		firstText: 'Blocks can be assgined to a variable then executed later').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Block Assignation Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorial >> addBlockExecutionSlidesIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {
		'[:x | x+2] value: 5.'. 
		'[:x :y| x + y] value:3 value:5.'. 
		'[GTPlayground open] value.'
	}.
		
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Blocks Execution';
		firstText: 'We can execute a block by sending it value messages').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Blocks Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorial >> addBlocksSlidesIn: aSlider [
	aSlider addNewSlide: (GtTitleSlide new
				titleText: ('Pharo101' asRopedText fontSize: 70);
				subtitleText: ('Blocks' asRopedText fontSize:50; foreground: Color gray)).
	aSlider addNewSlide: (GtTextSlide new
				firstText: 
					'They are anonymous methods that can be stored into variables and executed on demand';
				secondText: 'And are delimited by square brackets []').
	self addBlockExecutionSlidesIn: aSlider.
	self addBlockAssignationSlidesIn: aSlider.
]

{ #category : #adding }
PharoTutorial >> addCascadeOperatorSlidesIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {
		'"Both + messages are sent to 2"'.
		'2+3;+5.'.
		'"The one above is equivalent to: "'.
		'2+3. 2+5.'}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Cascade Operator';
		firstText: 'It is noted with ;';
		secondText: 'And it is useful to send messages to the same receiver').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Cascade Operator Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorial >> addCharactersSlidesIn: aSlider [
	| basicExamplesBook specialCharsBook |
	
	basicExamplesBook := self createBookFrom: {
		'$A.'. 
		'$A class.'. 
		'$A charCode.'. 
		'"You can print all 256 characters of the ASCII extended set"'. 
		'Character allByteCharacters.'
	}.
	specialCharsBook := self createBookFrom: {'Character space charCode.'. 'Character cr charCode.'}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Characters';
		firstText: 'They can be instantiated using $ operator').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Character Examples';
		element: (GtInspector createOnPlayBook: basicExamplesBook)).
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Special Characters';
		element: (GtInspector createOnPlayBook: specialCharsBook)).
]

{ #category : #adding }
PharoTutorial >> addConditionalsAndLoopsSlidesIn: aSlider [
	aSlider addNewSlide: (GtTitleSlide new
				titleText: ('Pharo101' asRopedText fontSize: 70);
				subtitleText: ('Conditionals and Loops' asRopedText fontSize:50; foreground: Color gray)).
	self addConditionalsSlidesIn: aSlider.
	self addLoopsSlidesIn: aSlider.
	self addIteratorsSlidesIn: aSlider.
]

{ #category : #adding }
PharoTutorial >> addConditionalsSlidesIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {
		'1 < 2 ',Character cr asString,'	ifTrue:[100]',Character cr asString,'	ifFalse:[42].'. 
		'$a > $b',Character cr asString,'	ifTrue:[100]',Character cr asString,'	ifFalse:[42].'
	}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Conditionals';
		firstText: 'Are just messages sent to Boolean objects';
		secondText: 'The messages are: ifTrue: , ifFalse: , ifTrue:ifFalse:').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Conditionals Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorial >> addDynamicArraysSlidesIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {'{ (2+3). (6*6) }.'. '{(2+3) . (6*6) . ''Hello'', ''world''} size.'}.
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Dynamic Arrays';
		firstText: 'Dynamic Arrays are created at execution time').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Dynamic Array Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorial >> addEnvironmentSlidesIn: aSlider [
	| inspectorExamplesBook browserExamplesBook debuggerExamplesBook |
	inspectorExamplesBook := self createBookFrom: {
		'Date today inspect.'.
		'PharoTutorial inspect.'
	}.
	browserExamplesBook := self createBookFrom: {
		'PharoTutorial browse.'
	}.
	debuggerExamplesBook := self createBookFrom: {
		'2/0.'
	}.

	aSlider addNewSlide: (GtTitleSlide new
				titleText: ('Pharo101' asRopedText fontSize: 70);
				subtitleText: ('Pharo environment' asRopedText fontSize:50; foreground: Color gray)).
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'The Inspector';
		firstText: 'Pharo is full of objects: windows, text, numbers, dates, colors and much more';
		secondText: 'Every object understands the message #inspect resulting in a window showing details about the object').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Inspector Examples';
		element: (GtInspector createOnPlayBook: inspectorExamplesBook)).
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'The Browser';
		firstText: 'Using the message #browse on a class, you get a more detailed view of that class').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Browser Examples';
		element: (GtInspector createOnPlayBook: browserExamplesBook)).
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'The Debugger';
		firstText: 'It is the most famous tool of Smalltalk environment';
		secondText: 'It will open as soon as an unmanaged Exception occurs').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Debugger Examples';
		element: (GtInspector createOnPlayBook: debuggerExamplesBook)).
]

{ #category : #adding }
PharoTutorial >> addInstantiationSlidesIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {
		'"The message #allInstances answers an array with all the instances of the class it is sent to"'.
		'SimpleButtonMorph allInstances size.'.
		'"Below, the message #new will create an instance of the class it is sent to, thus resulting in an OrderedCollection with 0 elements."'.
		'collection := OrderedCollection new.'
	}.
	
	aSlider addNewSlide: (GtTitleSlide new
				titleText: ('Pharo101' asRopedText fontSize: 70);
				subtitleText: ('Instantiation' asRopedText fontSize:50; foreground: Color gray)).
	aSlider addNewSlide: (GtTextSlide new
		firstText: 'Objects are instances of their class';
		secondText: 'Usually, we send the message #new to a class to create an instance of that class').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Instantiation Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorial >> addIteratorsSlidesIn: aSlider [
	| aBook doExample enterChar |
	enterChar := Character cr asString.
	doExample := 'y:=0.',enterChar,'#(11 38 3 -2 10) do: [:each | y:=y+each].',enterChar,'^y.'.
	aBook := self createBookFrom: {
		doExample.
		'#(11 38 3 -2 10) collect: [:each | each abs].'.
		'#(11 38 3 -2 10) select: [:each | each odd].'.
		'#(11 38 3 -2 10) reject: [:each | each > 10].'
	}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Iterators';
		firstText: 
			'They are messages sent to a collection of objects evaluating the block for each element').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Iterators Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorial >> addKeywordMessagesSlidesIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {
		'"The message is between:and: sent to object 4"'.
		'4 between: 0 and: 10.'. 
		'1 max: 3.'.
		'"The message is r:g:b: implemented on class Color"'.
		'Color r:1 g:0 b:0.'
	}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Keyword Messages';
		firstText: 'They are messages with arguments';
		secondText: 'And have the following form: anObject aKey: anotherObject aKey2: anotherObject2').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Keyword Messages Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorial >> addLoopsSlidesIn: aSlider [
	| aBook firstExample secondExample thirdExample enterChar |
	enterChar := Character cr asString.
	firstExample := 'x := 0.',enterChar,'1 to: 10 do: [:i | x := x+i].',enterChar, '^ x.'.
	secondExample := 'x := 0.',enterChar,'1 to: 10 by: 2 do: [:i | x := x+i].',enterChar, '^ x.'.
	thirdExample := 'x := 0.',enterChar,'10 to: 0 by: -2 do: [:i | x := x+i].',enterChar, '^ x.'.
	
	aBook := self createBookFrom: {
		firstExample.
		secondExample.
		thirdExample
	}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Loops';
		firstText: 'They are high-level collection iterators, implemented as regular methods';
		secondText: 'Basic loops: to:do: , to:by:do:').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Loops Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorial >> addMathematicalPrecedenceSlidesIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {'2*10+2.'. '2+2*10.'. '2+(2*10).'. '8-5/2.'}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Mathematical Precedence';
		firstText: 'Traditional precedence rules from mathematics do not apply in Pharo';
		secondText: 'Messages are executed from left to right. Only parentheses can change this').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Mathematical Precedence Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorial >> addMessagesExecutionOrderSlidesIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {'2 + 3 squared.'. '2 raisedTo: 3 + 2.'. '-3 abs negated reciprocal.'}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Messages Execution Order';
		firstText: 'The order of execution is: Unary -> Binary -> Keywords';
		secondText: 'Between messages of similar precedence, they are executed from left to right').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Messages Execution Order Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorial >> addMessagesSlidesIn: aSlider [
	aSlider addNewSlide: (GtTitleSlide new
				titleText: ('Pharo101' asRopedText fontSize: 70);
				subtitleText: ('Messages' asRopedText fontSize:50; foreground: Color gray)).
	aSlider addNewSlide: (GtTextSlide new
				firstText: 'Messages are sent to objects.';
				secondText: 'There are three types of messages: Unary, Binary and Keyword').
	self addUnaryMessagesSlidesIn: aSlider.
	self addBinaryMessagesSlidesIn: aSlider.
	self addKeywordMessagesSlidesIn: aSlider.
	self addMessagesExecutionOrderSlidesIn: aSlider.
	self addParenthesesSlidesIn: aSlider.
	self addMathematicalPrecedenceSlidesIn: aSlider.
	self addCascadeOperatorSlidesIn: aSlider.
]

{ #category : #adding }
PharoTutorial >> addNumbersSlidesIn: aSlider [
	| aBook |
	
	aBook := self createBookFrom: {'2+3.'. '20 factorial.'. '1/3.'. '1 class maxVal.'}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Numbers';
		firstText: '1, 2, 100, 2/3 ... are all Numbers';
		secondText: 'They all respond to many messages evaluating mathematical expressions').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Number Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorial >> addParenthesesSlidesIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {'(2+3) squared.'. '(2 raisedTo: 3) + 2.'}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Parentheses';
		firstText: 'They can change the order of execution').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Parentheses Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorial >> addReflectionSlidesIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {
		'"For example, we can see all the methods implemented in a class"'.
		'PharoTutorial selectors.'
	}.
	
	aSlider addNewSlide: (GtTitleSlide new
				titleText: ('Pharo101' asRopedText fontSize: 70);
				subtitleText: ('Reflection' asRopedText fontSize:50; foreground: Color gray)).
	aSlider addNewSlide: (GtTextSlide new
		firstText: 'It allows us to inspect and change the system at runtime').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Reflection Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorial >> addStringsSlidesIn: aSlider [
	| basicExamplesBook accessingBook concatenationBook |
	
	basicExamplesBook := self createBookFrom: {'''This is a string''.'. 
		'''This is a string'' size.'. '''abc'' asUppercase.'. '''Hello world'' reverse.'}.	
	accessingBook := self createBookFrom: {'''Hello world'' at: 1.'. '''Hello world'' at: 11.'}.
	concatenationBook := self createBookFrom: {'''Hello'','' world''.'. '''Strings are'','' cool''.'}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Strings';
		firstText: 'A String is a collection of characters';
		secondText: 'To create them, you can use single quotes').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'String Examples';
		element: (GtInspector createOnPlayBook: basicExamplesBook)).
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'You can access each character using at: message';
		element: (GtInspector createOnPlayBook: accessingBook)).
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'And you can concatenate strings using the comma operator';
		element: (GtInspector createOnPlayBook: concatenationBook)).
]

{ #category : #adding }
PharoTutorial >> addSymbolsSlidesIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {
		'''MySymbol'' asSymbol.'. 
		'#MySymbol asString.'.
		'"Message == return true is the two objects are the SAME"'.
		'(2 asString) == (2 asString).'. 
		'(2 asString) asSymbol == (2 asString) asSymbol.'
	}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Symbols';
		firstText: 'A Symbol is a String which is guaranteed to be globally unique.';
		secondText: 'There is one and only one Symbol #MySymbol, but there can be several ''MySymbol'' String objects').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Symbol Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorial >> addUnaryMessagesSlidesIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {'1 class.'. 'false not.'. 'Date today.'. 'Float pi.'}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Unary Messages';
		firstText: 'They have the following form: anObject aMessage').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Unary Messages Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #'as yet unclassified' }
PharoTutorial >> createBookFrom: aCollection [
	| aBook |
	aBook := GtPlayBook newDefault.
	aBook pages first snippets first sourceCode: (aCollection at: 1).
	(aCollection size > 1)
		ifTrue: [ aCollection allButFirst do: [:el |
				aBook pages first addSnippet: GtCoderSnippet new.
				aBook pages last snippets last sourceCode: el] ].
	^ aBook.
]

{ #category : #accessing }
PharoTutorial >> start [
	| slider |
	
	slider := GtSlider new.
	slider addNewSlide: (GtTitleSlide new
				titleText: ('Pharo101' asRopedText fontSize: 70);
				subtitleText: 
					('Tutorial for beginners' asRopedText fontSize: 50; foreground: Color gray)).
	
	self addBasicTypesSlidesIn: slider.
	self addMessagesSlidesIn: slider.
	self addBlocksSlidesIn: slider.
	self addConditionalsAndLoopsSlidesIn: slider.
	self addInstantiationSlidesIn: slider.
	self addReflectionSlidesIn: slider.
	self addEnvironmentSlidesIn: slider.
	
	slider addNewSlide: (GtTitleSlide new
				titleText: ('Enjoy programming in Pharo' asRopedText fontSize: 70)).
	
	^ slider.
]
