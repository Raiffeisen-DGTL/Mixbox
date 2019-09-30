#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 130000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 140000

#import "Xcode_11_0_XCTAutomationSupport_CDStructures.h"
#import "Xcode_11_0_SharedHeader.h"
#import <Foundation/Foundation.h>

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTTimeoutControls : NSObject <NSSecureCoding>
{
    double _mainThreadResponsivenessTimeout;
    double _queryExecutionTimeout;
}

+ (_Bool)supportsSecureCoding;
+ (id)standardTimeoutControls;
+ (double)defaultQueryExecutionTimeout;
+ (void)setDefaultQueryExecutionTimeout:(double)arg1;
+ (double)defaultMainThreadResponsivenessTimeout;
+ (void)setDefaultMainThreadResponsivenessTimeout:(double)arg1;
@property double queryExecutionTimeout; // @synthesize queryExecutionTimeout=_queryExecutionTimeout;
@property double mainThreadResponsivenessTimeout; // @synthesize mainThreadResponsivenessTimeout=_mainThreadResponsivenessTimeout;
- (void)encodeWithCoder:(id)arg1;
- (id)initWithCoder:(id)arg1;

@end

#endif