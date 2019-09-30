#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 130000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 140000

#import "Xcode_11_0_XCTest_CDStructures.h"
#import "Xcode_11_0_SharedHeader.h"
#import <Foundation/Foundation.h>

@class XCUITestContextScope;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCUITestContextScope : NSObject
{
    XCUITestContextScope *_parentScope;
    NSMutableArray *_handlers;
}

@property(readonly, copy) NSMutableArray *handlers; // @synthesize handlers=_handlers;
@property(readonly) XCUITestContextScope *parentScope; // @synthesize parentScope=_parentScope;
- (id)initWithParentScope:(id)arg1;

@end

#endif