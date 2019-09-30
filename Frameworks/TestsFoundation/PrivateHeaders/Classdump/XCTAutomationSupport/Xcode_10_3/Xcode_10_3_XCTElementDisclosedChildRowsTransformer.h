#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 120400 && __IPHONE_OS_VERSION_MAX_ALLOWED < 130000

#import "Xcode_10_3_XCTAutomationSupport_CDStructures.h"
#import "Xcode_10_3_SharedHeader.h"
#import "Xcode_10_3_XCTElementSetCodableTransformer.h"

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTElementDisclosedChildRowsTransformer : XCTElementSetCodableTransformer
{
    
    
}

- (void)setStopsOnFirstMatch:(_Bool)arg1;
- (_Bool)stopsOnFirstMatch;
- (void)setTransformationDescription:(id)arg1;
- (id)transformationDescription;
- (id)requiredKeyPathsOrError:(id *)arg1;
- (_Bool)supportsAttributeKeyPathAnalysis;
- (_Bool)supportsRemoteEvaluation;
- (id)iteratorForInput:(id)arg1;
- (id)transform:(id)arg1 relatedElements:(id *)arg2;

@end

#endif