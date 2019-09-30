#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 120200 && __IPHONE_OS_VERSION_MAX_ALLOWED < 120400

#import "Xcode_10_2_XCTAutomationSupport_CDStructures.h"
#import "Xcode_10_2_SharedHeader.h"
#import "Xcode_10_2_XCTElementSetCodableTransformer.h"

@class XCTIndexingTransformerIterator;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTElementIndexingTransformer : XCTElementSetCodableTransformer
{
    unsigned long long _elementIndex;
    XCTIndexingTransformerIterator *_currentIterator;
}

+ (_Bool)supportsSecureCoding;
@property(retain) XCTIndexingTransformerIterator *currentIterator; // @synthesize currentIterator=_currentIterator;
@property(readonly) unsigned long long elementIndex; // @synthesize elementIndex=_elementIndex;
- (id)iteratorForInput:(id)arg1;
- (void)encodeWithCoder:(id)arg1;
- (id)initWithCoder:(id)arg1;
- (id)requiredKeyPathsOrError:(id *)arg1;
- (_Bool)supportsAttributeKeyPathAnalysis;
- (_Bool)supportsRemoteEvaluation;
- (id)transform:(id)arg1 relatedElements:(id *)arg2;
- (_Bool)isEqual:(id)arg1;
- (unsigned long long)hash;
- (id)initWithElementIndex:(unsigned long long)arg1;

@end

#endif
