#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 130000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 140000

#import "Xcode_11_0_XCTAutomationSupport_CDStructures.h"
#import "Xcode_11_0_SharedHeader.h"
#import "Xcode_11_0_XCTCapabilitiesProviding.h"
#import <Foundation/Foundation.h>

@protocol XCTMatchingElementIterator;

@class XCElementSnapshot, XCTCapabilities;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@protocol XCTElementSetTransformer <NSObject, NSCopying, XCTCapabilitiesProviding>
@property _Bool stopsOnFirstMatch;
@property(readonly) _Bool supportsAttributeKeyPathAnalysis;
@property(copy) NSString *transformationDescription;
@property(readonly) _Bool supportsRemoteEvaluation;
- (NSSet *)requiredKeyPathsOrError:(id *)arg1;
- (_Bool)canBeRemotelyEvaluatedWithCapabilities:(XCTCapabilities *)arg1;
- (id <XCTMatchingElementIterator>)iteratorForInput:(XCElementSnapshot *)arg1;
- (NSOrderedSet *)transform:(NSOrderedSet *)arg1 relatedElements:(id *)arg2;
@end

#endif
