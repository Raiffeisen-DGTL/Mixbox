#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 120200 && __IPHONE_OS_VERSION_MAX_ALLOWED < 120400

#import "Xcode_10_2_XCTest_CDStructures.h"
#import "Xcode_10_2_SharedHeader.h"
#import "Xcode_10_2_XCTTestWorker.h"
#import <Foundation/Foundation.h>

@protocol XCTTestRunSessionDelegate;

@class XCTBlockingQueue, XCTestConfiguration;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTTestRunSession : NSObject <XCTTestWorker>
{
    XCTestConfiguration *_testConfiguration;
    id <XCTTestRunSessionDelegate> _delegate;
    XCTBlockingQueue *_workQueue;
}

@property(retain) XCTBlockingQueue *workQueue; // @synthesize workQueue=_workQueue;
@property __weak id <XCTTestRunSessionDelegate> delegate; // @synthesize delegate=_delegate;
@property(retain) XCTestConfiguration *testConfiguration; // @synthesize testConfiguration=_testConfiguration;
- (void)shutdown;
- (void)executeTestIdentifiers:(id)arg1 skippingTestIdentifiers:(id)arg2 completionHandler:(CDUnknownBlockType)arg3 completionQueue:(id)arg4;
- (void)fetchDiscoveredTestClasses:(CDUnknownBlockType)arg1;
- (_Bool)runTestsAndReturnError:(id *)arg1;
- (_Bool)_preTestingInitialization;
- (void)resumeAppSleep:(id)arg1;
- (id)suspendAppSleep;
- (id)initWithTestConfiguration:(id)arg1;

// Remaining properties

@end

#endif
