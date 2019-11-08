#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 120400 && __IPHONE_OS_VERSION_MAX_ALLOWED < 130000

#import "Xcode_10_3_XCTest_CDStructures.h"
#import "Xcode_10_3_SharedHeader.h"
#import "Xcode_10_3_XCUIScreenDataSource.h"
#import <Foundation/Foundation.h>

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCUILocalDeviceScreenDataSource : NSObject <XCUIScreenDataSource>
{
}

- (id)_clippedScreenshotData:(id)arg1 compressionQuality:(double)arg2 rect:(struct CGRect)arg3 scale:(double)arg4;
- (void)requestScreenshotOfScreenWithID:(long long)arg1 withRect:(struct CGRect)arg2 scale:(double)arg3 formatUTI:(id)arg4 compressionQuality:(double)arg5 withReply:(CDUnknownBlockType)arg6;
- (void)requestScaleForScreenWithIdentifier:(long long)arg1 completion:(CDUnknownBlockType)arg2;
- (void)requestScreenIdentifiersWithCompletion:(CDUnknownBlockType)arg1;

// Remaining properties

@end

#endif