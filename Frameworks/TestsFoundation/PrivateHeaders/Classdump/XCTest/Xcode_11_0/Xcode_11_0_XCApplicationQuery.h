#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 130000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 140000

#import "Xcode_11_0_XCTest_CDStructures.h"
#import "Xcode_11_0_SharedHeader.h"
#import <XCTest/XCUIElementQuery.h>

@class XCElementSnapshot, XCUIApplication;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCApplicationQuery : XCUIElementQuery
{
    XCUIApplication *_application;
    XCElementSnapshot *_lastSnapshot;
}

@property(retain) XCElementSnapshot *lastSnapshot; // @synthesize lastSnapshot=_lastSnapshot;
- (id)application;
- (id)initWithApplication:(id)arg1;
- (void)dealloc;

@end

#endif