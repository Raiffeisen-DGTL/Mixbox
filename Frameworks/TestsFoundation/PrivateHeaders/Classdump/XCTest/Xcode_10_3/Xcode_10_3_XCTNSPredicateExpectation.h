#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 120400 && __IPHONE_OS_VERSION_MAX_ALLOWED < 130000

#import "Xcode_10_3_XCTest_CDStructures.h"
#import "Xcode_10_3_SharedHeader.h"
#import <XCTest/XCTNSPredicateExpectation.h>
#import <XCTest/XCTestExpectation.h>

@class XCTNSPredicateExpectationImplementation, _XCTNSPredicateExpectationImplementation;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTNSPredicateExpectation ()
{
    _XCTNSPredicateExpectationImplementation *_internal;
}

@property(retain) _XCTNSPredicateExpectationImplementation *internal; // @synthesize internal=_internal;
- (void)considerFulfilling;
- (void)cleanup;
- (void)fulfill;
@property double pollingInterval;
- (id)debugDescription;
- (void)on_queue_setHasBeenWaitedOn:(_Bool)arg1;

- (void)dealloc;

// Remaining properties

@end

#endif