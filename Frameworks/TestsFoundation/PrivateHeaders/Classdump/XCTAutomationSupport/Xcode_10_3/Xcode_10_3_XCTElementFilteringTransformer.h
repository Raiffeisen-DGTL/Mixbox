#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 120400 && __IPHONE_OS_VERSION_MAX_ALLOWED < 130000

#import "Xcode_10_3_XCTAutomationSupport_CDStructures.h"
#import "Xcode_10_3_SharedHeader.h"
#import "Xcode_10_3_XCTElementSetCodableTransformer.h"

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTElementFilteringTransformer : XCTElementSetCodableTransformer
{
    long long _scope;
    NSPredicate *_predicate;
}

+ (_Bool)supportsSecureCoding;
@property(readonly, copy) NSPredicate *predicate; // @synthesize predicate=_predicate;
@property(readonly) long long scope; // @synthesize scope=_scope;
- (id)iteratorForInput:(id)arg1;
- (id)transform:(id)arg1 relatedElements:(id *)arg2;
- (id)_scopedExpansionOfInput:(id)arg1;
- (void)encodeWithCoder:(id)arg1;
- (id)initWithCoder:(id)arg1;
- (id)requiredKeyPathsOrError:(id *)arg1;
- (_Bool)supportsAttributeKeyPathAnalysis;
- (_Bool)supportsRemoteEvaluation;
- (_Bool)isEqual:(id)arg1;
- (unsigned long long)hash;
- (id)initWithScope:(long long)arg1 predicate:(id)arg2;

@end

#endif