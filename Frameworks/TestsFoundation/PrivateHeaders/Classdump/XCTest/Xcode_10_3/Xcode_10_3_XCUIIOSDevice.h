#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 120400 && __IPHONE_OS_VERSION_MAX_ALLOWED < 130000

#import "Xcode_10_3_XCTest_CDStructures.h"
#import "Xcode_10_3_SharedHeader.h"
#import "Xcode_10_3_XCUIIPhoneOSDevice.h"

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@protocol XCUIIOSDevice <XCUIIPhoneOSDevice>
@property(nonatomic) long long orientation;
- (void)pressLockButton;
- (void)holdHomeButtonForDuration:(double)arg1;
- (void)pressButton:(long long)arg1;
@end

#endif
