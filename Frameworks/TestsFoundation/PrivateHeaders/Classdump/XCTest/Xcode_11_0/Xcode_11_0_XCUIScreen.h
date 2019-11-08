#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 130000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 140000

#import "Xcode_11_0_XCTest_CDStructures.h"
#import "Xcode_11_0_SharedHeader.h"
#import <Foundation/Foundation.h>
#import <XCTest/XCUIElement.h>
#import <XCTest/XCUIScreen.h>

@protocol XCUIDevice, XCUIScreenDataSource;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCUIScreen ()
{
    _Bool _isMainScreen;
    long long _displayID;
    id <XCUIDevice> _device;
    id <XCUIScreenDataSource> _screenDataSource;
}

@property(readonly) id <XCUIScreenDataSource> screenDataSource; // @synthesize screenDataSource=_screenDataSource;
@property(readonly) __weak id <XCUIDevice> device; // @synthesize device=_device;
@property(readonly) _Bool isMainScreen; // @synthesize isMainScreen=_isMainScreen;
@property(readonly) long long displayID; // @synthesize displayID=_displayID;
- (id)_screenshotDataForQuality:(long long)arg1 rect:(struct CGRect)arg2 error:(id *)arg3;
- (id)screenshotDataForQuality:(long long)arg1 rect:(struct CGRect)arg2 error:(id *)arg3;
- (id)screenshot;
- (_Bool)isEqual:(id)arg1;
@property(readonly) double scale;
- (id)initWithDisplayID:(long long)arg1 isMainScreen:(_Bool)arg2 device:(id)arg3 screenDataSource:(id)arg4;

// Remaining properties

@end

#endif