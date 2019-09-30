#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 120400 && __IPHONE_OS_VERSION_MAX_ALLOWED < 130000

#import "Xcode_10_3_XCTest_CDStructures.h"
#import "Xcode_10_3_SharedHeader.h"
#import <Foundation/Foundation.h>
#import <XCTest/XCTestRun.h>

@class XCInternalTestRun, XCTest, _XCInternalTestRun;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTestRun ()
{
    id _internalTestRun;
}

@property(readonly) _XCInternalTestRun *implementation; // @synthesize implementation=_internalTestRun;
@property unsigned long long unexpectedExceptionCountBeforeCrash;
@property unsigned long long failureCountBeforeCrash;
@property unsigned long long executionCountBeforeCrash;

- (void)stop;
- (void)start;
- (id)description;
- (id)init;

@end

#endif