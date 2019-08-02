Class {
	#name : #PharoTutorial,
	#superclass : #Object,
	#category : #'Tutorial-PharoForBeginners'
}

{ #category : #adding }
PharoTutorial >> addArraysSlideIn: aSlider [
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
PharoTutorial >> addBinaryMessagesSlideIn: aSlider [
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
PharoTutorial >> addBlockAssignationSlideIn: aSlider [
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
PharoTutorial >> addBlockExecutionSlideIn: aSlider [
	| aBook |
	aBook := self createBookFrom:
		{'[:x | x+2] value: 5.'. '[:x :y| x + y] value:3 value:5.'. '[GTPlayground open] value.'}.
		
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Blocks Execution';
		firstText: 'We can execute a block by sending it value messages').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Blocks Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorial >> addCascadeOperatorSlideIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {'2+3;+5.'. '2+3. 2+5.'}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Cascade Operator';
		firstText: 'It is noted with ;';
		secondText: 'And it is useful to send messages to the same receiver').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Cascade Operator Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorial >> addCharactersSlideIn: aSlider [
	| basicExamplesBook specialCharsBook |
	
	basicExamplesBook := self createBookFrom: 
		{'$A.'. '$A class.'. '$A charCode.'. 'Character allByteCharacters.'}.
	specialCharsBook := self createBookFrom: {'Character space charCode.'. 'Character cr charCode.'}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Characters';
		firstText: 'It can be instantiated using $ operator').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Character Examples';
		element: (GtInspector createOnPlayBook: basicExamplesBook)).
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Special Characters';
		element: (GtInspector createOnPlayBook: specialCharsBook)).
]

{ #category : #adding }
PharoTutorial >> addDynamicArraysSlideIn: aSlider [
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
PharoTutorial >> addKeywordMessagesSlideIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {'4 between: 0 and: 10.'. '1 max: 3.'. 'Color r:1 g:0 b:0.'}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Keyword Messages';
		firstText: 'They are messages with arguments';
		secondText: 'And have the following form: anObject aKey: anotherObject aKey2: anotherObject2').
	aSlider addNewSlide: (GtInfoElementSlide new
		text: 'Keyword Messages Examples';
		element: (GtInspector createOnPlayBook: aBook)).
]

{ #category : #adding }
PharoTutorial >> addMathematicalPrecedenceSlideIn: aSlider [
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
PharoTutorial >> addMessagesExecutionOrderSlideIn: aSlider [
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
PharoTutorial >> addNumbersSlideIn: aSlider [
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
PharoTutorial >> addParenthesesSlideIn: aSlider [
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
PharoTutorial >> addStringsSlideIn: aSlider [
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
		text: 'And you can concatenate string using the comma operator';
		element: (GtInspector createOnPlayBook: concatenationBook)).
]

{ #category : #adding }
PharoTutorial >> addSymbolsSlideIn: aSlider [
	| aBook |
	aBook := self createBookFrom: {'''MySymbol'' asSymbol.'. '#MySymbol asString.'. 
		'(2 asString) == (2 asString).'. '(2 asString) asSymbol == (2 asString) asSymbol.'}.
	
	aSlider addNewSlide: (GtTextSlide new
		subtitle: 'Symbols';
		firstText: 'A Symbol is a String which is guaranteed to be globally unique.';
		secondText: 'There is one an only Symbol #MySymbol, but there can be several ''MySymbol'' String objects').
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
				subtitleText: ('Tutorial for beginners' asRopedText fontSize: 50; foreground: Color gray)).
				
	slider addNewSlide: (GtTitleSlide new
				titleText: ('Pharo101' asRopedText fontSize: 70);
				subtitleText: ('Basic types' asRopedText fontSize:50; foreground: Color gray)).
	self addNumbersSlideIn: slider.
	self addCharactersSlideIn: slider.
	self addStringsSlideIn: slider.
	self addSymbolsSlideIn: slider.
	self addArraysSlideIn: slider.
	self addDynamicArraysSlideIn: slider.
	
	slider addNewSlide: (GtTitleSlide new
				titleText: ('Pharo101' asRopedText fontSize: 70);
				subtitleText: ('Messages' asRopedText fontSize:50; foreground: Color gray)).
	slider addNewSlide: (GtTextSlide new
				firstText: 'Messages are sent to objects.';
				secondText: 'There are three types of messages: Unary, Binary and Keyword').
	self addUnaryMessagesSlidesIn: slider.
	self addBinaryMessagesSlideIn: slider.
	self addKeywordMessagesSlideIn: slider.
	self addMessagesExecutionOrderSlideIn: slider.
	self addParenthesesSlideIn: slider.
	self addMathematicalPrecedenceSlideIn: slider.
	self addCascadeOperatorSlideIn: slider.
	
	slider addNewSlide: (GtTitleSlide new
				titleText: ('Pharo101' asRopedText fontSize: 70);
				subtitleText: ('Blocks' asRopedText fontSize:50; foreground: Color gray)).
	slider addNewSlide: (GtTextSlide new
				firstText: 'They are anonymous methods that can be stored into variables and executed on demand';
				secondText: 'And are delimited by square brackets []').
	self addBlockExecutionSlideIn: slider.
	self addBlockAssignationSlideIn: slider.
	
	^ slider.
]
