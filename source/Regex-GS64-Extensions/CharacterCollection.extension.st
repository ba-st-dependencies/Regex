Extension { #name : #CharacterCollection }

{ #category : #'*Regex-GS64-Extensions' }
CharacterCollection >> allRangesOfRegexMatches: rxString [

	^rxString asRegex matchingRangesIn: self
]

{ #category : #'*Regex-GS64-Extensions' }
CharacterCollection >> allRegexMatches: rxString [

	^rxString asRegex matchesIn: self
]

{ #category : #'*Regex-GS64-Extensions' }
CharacterCollection >> asRegex [
	"Compile the receiver as a regex matcher. May raise RxParser>>syntaxErrorSignal
	or RxParser>>compilationErrorSignal."

	^RxParser preferredMatcherClass for: (RxParser new parse: self)
]

{ #category : #'*Regex-GS64-Extensions' }
CharacterCollection >> asRegexIgnoringCase [
	"Compile the receiver as a regex matcher. May raise RxParser>>syntaxErrorSignal
	or RxParser>>compilationErrorSignal."

	^RxParser preferredMatcherClass
		for: (RxParser new parse: self)
		ignoreCase: true
]

{ #category : #'*Regex-GS64-Extensions' }
CharacterCollection >> copyWithRegex: rxString matchesReplacedWith: aString [

	^rxString asRegex
		copy: self replacingMatchesWith: aString
]

{ #category : #'*Regex-GS64-Extensions' }
CharacterCollection >> copyWithRegex: rxString matchesTranslatedUsing: aBlock [

	^rxString asRegex
		copy: self translatingMatchesUsing: aBlock
]

{ #category : #'*Regex-GS64-Extensions' }
CharacterCollection >> matchesRegex: regexString [
	"Test if the receiver matches a regex.  May raise RxParser>>regexErrorSignal or
	child signals."

	^regexString asRegex matches: self
]

{ #category : #'*Regex-GS64-Extensions' }
CharacterCollection >> matchesRegexIgnoringCase: regexString [
	"Test if the receiver matches a regex.  May raise RxParser>>regexErrorSignal or
	child signals."

	^regexString asRegexIgnoringCase matches: self
]

{ #category : #'*Regex-GS64-Extensions' }
CharacterCollection >> prefixMatchesRegex: regexString [
	"Test if the receiver's prefix matches a regex.
	May raise RxParser class>>regexErrorSignal or child signals."

	^regexString asRegex matchesPrefix: self
]

{ #category : #'*Regex-GS64-Extensions' }
CharacterCollection >> prefixMatchesRegexIgnoringCase: regexString [
	"Test if the receiver's prefix matches a regex.
	May raise RxParser class>>regexErrorSignal or child signals."

	^regexString asRegexIgnoringCase matchesPrefix: self
]

{ #category : #'*Regex-GS64-Extensions' }
CharacterCollection >> regex: regexString matchesCollect: aBlock [

	^regexString asRegex matchesIn: self collect: aBlock
]

{ #category : #'*Regex-GS64-Extensions' }
CharacterCollection >> regex: regexString matchesDo: aBlock [

	^regexString asRegex matchesIn: self do: aBlock
]

{ #category : #'*Regex-GS64-Extensions' }
CharacterCollection >> search: aString [
	"Compatibility method to make regexp and strings work polymorphicly"
	^ aString includesSubstring: self
]
