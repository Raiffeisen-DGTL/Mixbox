#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 120200 && __IPHONE_OS_VERSION_MAX_ALLOWED < 120400

#import "Xcode_10_2_XCTest_CDStructures.h"
#import "Xcode_10_2_SharedHeader.h"
#import <Foundation/Foundation.h>

@class XCTActivityRecordStack, XCTestCase;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface _XCTContextImplementation : NSObject
{
    XCTActivityRecordStack *_activityRecordStack;
    XCTestCase *_testCase;
}

@property __weak XCTestCase *testCase; // @synthesize testCase=_testCase;
@property(readonly) XCTActivityRecordStack *activityRecordStack; // @synthesize activityRecordStack=_activityRecordStack;
- (id)init;

@end

#endif
