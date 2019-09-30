#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 120400 && __IPHONE_OS_VERSION_MAX_ALLOWED < 130000

#import "Xcode_10_3_XCTest_CDStructures.h"
#import "Xcode_10_3_SharedHeader.h"
#import <Foundation/Foundation.h>

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTMetric : NSObject
{
    NSString *_identifier;
    NSString *_name;
    NSString *_units;
    NSDictionary *_baseline;
    NSDictionary *_defaultBaseline;
    NSArray *_measurements;
}

@property(copy) NSArray *measurements; // @synthesize measurements=_measurements;
@property(copy) NSDictionary *defaultBaseline; // @synthesize defaultBaseline=_defaultBaseline;
@property(copy) NSDictionary *baseline; // @synthesize baseline=_baseline;
@property(copy) NSString *units; // @synthesize units=_units;
@property(copy) NSString *name; // @synthesize name=_name;
@property(copy) NSString *identifier; // @synthesize identifier=_identifier;
- (id)init;

@end

#endif