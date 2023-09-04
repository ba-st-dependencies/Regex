Extension { #name : #String }

{ #category : #'*Regex-Extensions' }
String >> allRangesOfRegexMatches: rxString [

	^rxString asRegex matchingRangesIn: self
]

{ #category : #'*Regex-Extensions' }
String >> allRegexMatches: rxString [

	^rxString asRegex matchesIn: self
]

{ #category : #'*Regex-Extensions' }
String >> asRegex [
	"Compile the receiver as a regex matcher. May raise RxParser>>syntaxErrorSignal
	or RxParser>>compilationErrorSignal.
	This is a part of the Regular Expression Matcher package, (c) 1996, 1999 Vassili Bykov.
	Refer to `documentation' protocol of RxParser class for details."

	^RxParser preferredMatcherClass for: (RxParser new parse: self)
]

{ #category : #'*Regex-Extensions' }
String >> asRegexIgnoringCase [
	"Compile the receiver as a regex matcher. May raise RxParser>>syntaxErrorSignal
	or RxParser>>compilationErrorSignal.
	This is a part of the Regular Expression Matcher package, (c) 1996, 1999 Vassili Bykov.
	Refer to `documentation' protocol of RxParser class for details."

	^RxParser preferredMatcherClass
		for: (RxParser new parse: self)
		ignoreCase: true
]

{ #category : #'*Regex-Extensions' }
String >> copyWithRegex: rxString matchesReplacedWith: aString [

	^rxString asRegex
		copy: self replacingMatchesWith: aString
]

{ #category : #'*Regex-Extensions' }
String >> copyWithRegex: rxString matchesTranslatedUsing: aBlock [

	^rxString asRegex
		copy: self translatingMatchesUsing: aBlock
]

{ #category : #'*Regex-Extensions' }
String >> matchesRegex: regexString [
	"Test if the receiver matches a regex.  May raise RxParser>>regexErrorSignal or
	child signals.
	This is a part of the Regular Expression Matcher package, (c) 1996, 1999 Vassili Bykov.
	Refer to `documentation' protocol of RxParser class for details."

	^regexString asRegex matches: self
]

{ #category : #'*Regex-Extensions' }
String >> matchesRegexIgnoringCase: regexString [
	"Test if the receiver matches a regex.  May raise RxParser>>regexErrorSignal or
	child signals.
	This is a part of the Regular Expression Matcher package, (c) 1996, 1999 Vassili Bykov.
	Refer to `documentation' protocol of RxParser class for details."

	^regexString asRegexIgnoringCase matches: self
]

{ #category : #'*Regex-Extensions' }
String >> prefixMatchesRegex: regexString [
	"Test if the receiver's prefix matches a regex.
	May raise RxParser class>>regexErrorSignal or child signals.
	This is a part of the Regular Expression Matcher package, (c) 1996, 1999 Vassili Bykov.
	Refer to `documentation' protocol of RxParser class for details."

	^regexString asRegex matchesPrefix: self
]

{ #category : #'*Regex-Extensions' }
String >> prefixMatchesRegexIgnoringCase: regexString [
	"Test if the receiver's prefix matches a regex.
	May raise RxParser class>>regexErrorSignal or child signals.
	This is a part of the Regular Expression Matcher package, (c) 1996, 1999 Vassili Bykov.
	Refer to `documentation' protocol of RxParser class for details."

	^regexString asRegexIgnoringCase matchesPrefix: self
]

{ #category : #'*Regex-Extensions' }
String >> regex: rxString matchesCollect: aBlock [

	^rxString asRegex matchesIn: self collect: aBlock
]

{ #category : #'*Regex-Extensions' }
String >> regex: rxString matchesDo: aBlock [

	^rxString asRegex matchesIn: self do: aBlock
]

{ #category : #'*Regex-Extensions' }
String >> search: aString [
	"compatibility method to make regexp and strings work polymorphicly"
	^ aString includesSubstring: self
]
