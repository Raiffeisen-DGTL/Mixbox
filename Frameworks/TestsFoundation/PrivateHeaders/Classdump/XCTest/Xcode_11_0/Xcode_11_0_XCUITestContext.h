#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 130000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 140000

#import "Xcode_11_0_XCTest_CDStructures.h"
#import "Xcode_11_0_SharedHeader.h"
#import <Foundation/Foundation.h>

@class XCUITestContextScope;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCUITestContext : NSObject
{
    _Bool _didHandleUIInterruption;
    XCUITestContextScope *_currentScope;
}

+ (CDUnknownBlockType)defaultUIInterruptionMonitor_iOS;
@property _Bool didHandleUIInterruption; // @synthesize didHandleUIInterruption=_didHandleUIInterruption;
@property(retain, nonatomic) XCUITestContextScope *currentScope; // @synthesize currentScope=_currentScope;
- (_Bool)handleAsynchronousUIElement:(id)arg1;
- (void)removeUIInterruptionMonitor:(id)arg1;
- (id)addUIInterruptionMonitorWithDescription:(id)arg1 handler:(CDUnknownBlockType)arg2;
- (void)performInScope:(CDUnknownBlockType)arg1;
@property(readonly, copy) NSArray *handlers;
- (id)init;

@end

#endif