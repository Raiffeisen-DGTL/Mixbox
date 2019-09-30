#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 120400 && __IPHONE_OS_VERSION_MAX_ALLOWED < 130000

#import "Xcode_10_3_XCTAutomationSupport_CDStructures.h"
#import "Xcode_10_3_SharedHeader.h"

@class XCAccessibilityElement, XCTElementQuery;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@protocol XCTRemoteApplicationAutomationTarget
- (id)_XCT_notifyWhenAnimationsAreIdle;
- (id)_XCT_notifyWhenMainRunLoopIsIdle;
- (id)_XCT_attributesForElement:(XCAccessibilityElement *)arg1 attributes:(NSArray *)arg2;
- (id)_XCT_fetchMatchesForQuery:(XCTElementQuery *)arg1;
@end

#endif
