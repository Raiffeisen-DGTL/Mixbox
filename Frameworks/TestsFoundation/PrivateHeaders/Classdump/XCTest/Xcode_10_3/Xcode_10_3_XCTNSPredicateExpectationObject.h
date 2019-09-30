#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 120400 && __IPHONE_OS_VERSION_MAX_ALLOWED < 130000

#import "Xcode_10_3_XCTest_CDStructures.h"
#import "Xcode_10_3_SharedHeader.h"
#import <Foundation/Foundation.h>

@class XCTNSPredicateExpectation;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@protocol XCTNSPredicateExpectationObject <NSObject>

@optional
- (_Bool)evaluatePredicateForExpectation:(XCTNSPredicateExpectation *)arg1 debugMessage:(id *)arg2;
@end

#endif
