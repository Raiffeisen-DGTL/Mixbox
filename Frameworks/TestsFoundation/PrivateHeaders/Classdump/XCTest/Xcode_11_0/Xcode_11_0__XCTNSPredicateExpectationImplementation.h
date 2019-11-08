#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 130000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 140000

#import "Xcode_11_0_XCTest_CDStructures.h"
#import "Xcode_11_0_SharedHeader.h"
#import <Foundation/Foundation.h>

@protocol XCTNSPredicateExpectationObject;

@class XCTNSPredicateExpectation;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface _XCTNSPredicateExpectationImplementation : NSObject
{
    XCTNSPredicateExpectation *_expectation;
    id <XCTNSPredicateExpectationObject> _object;
    NSPredicate *_predicate;
    CDUnknownBlockType _handler;
    NSRunLoop *_timerRunLoop;
    NSTimer *_timer;
    double _pollingInterval;
    NSString *_debugDescription;
    NSObject *_queue;
    _Bool _hasCleanedUp;
    _Bool _isEvaluating;
}

@property double pollingInterval; // @synthesize pollingInterval=_pollingInterval;
@property(copy) NSString *debugDescription; // @synthesize debugDescription=_debugDescription;
@property(readonly, copy) NSPredicate *predicate; // @synthesize predicate=_predicate;
@property(readonly) id <XCTNSPredicateExpectationObject> object; // @synthesize object=_object;
- (void)cleanup;
- (_Bool)_shouldFulfillForExpectation:(id)arg1 object:(id)arg2 handler:(CDUnknownBlockType)arg3;
- (void)_considerFulfilling;
@property(copy) CDUnknownBlockType handler;
- (void)_scheduleTimer;
- (void)startPolling;
- (id)initWithPredicate:(id)arg1 object:(id)arg2 expectation:(id)arg3;
- (void)dealloc;

@end

#endif