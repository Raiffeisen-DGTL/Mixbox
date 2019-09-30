#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 120400 && __IPHONE_OS_VERSION_MAX_ALLOWED < 130000

#import "Xcode_10_3_XCTest_CDStructures.h"
#import "Xcode_10_3_SharedHeader.h"
#import "Xcode_10_3_XCUIEventSynthesisRequest.h"
#import <Foundation/Foundation.h>

@class XCSynthesizedEventRecord;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTRunnerDaemonSessionEventRequest : NSObject <XCUIEventSynthesisRequest>
{
    XCSynthesizedEventRecord *_event;
    double _upperBoundOnDuration;
}

@property double upperBoundOnDuration; // @synthesize upperBoundOnDuration=_upperBoundOnDuration;
@property(readonly) XCSynthesizedEventRecord *event; // @synthesize event=_event;
- (void)cancel;
- (id)initWithEvent:(id)arg1;

// Remaining properties

@end

#endif