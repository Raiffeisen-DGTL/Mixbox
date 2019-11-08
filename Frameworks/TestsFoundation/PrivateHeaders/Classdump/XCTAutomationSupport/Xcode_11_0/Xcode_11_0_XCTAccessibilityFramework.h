#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 130000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 140000

#import "Xcode_11_0_XCTAutomationSupport_CDStructures.h"
#import "Xcode_11_0_SharedHeader.h"
#import <Foundation/Foundation.h>

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@protocol XCTAccessibilityFramework <NSObject>
@property _Bool allowsRemoteAccess;
- (void)performWithAXTimeout:(double)arg1 block:(void (^)(void))arg2;
- (NSArray *)attributes:(NSArray *)arg1 forElement:(/* unknown type (const struct __AXUIElement) */ void *)arg2 error:(id *)arg3;
- (long long)appOrientationForElement:(/* unknown type (const struct __AXUIElement) */ void *)arg1 error:(id *)arg2;
- (struct CGRect)frameForElement:(/* unknown type (const struct __AXUIElement) */ void *)arg1 error:(id *)arg2;
- (/* unknown type (const struct __AXUIElement) */ void *)mainWindowForElement:(/* unknown type (const struct __AXUIElement) */ void *)arg1 error:(id *)arg2;
- (NSDictionary *)userTestingSnapshotForElement:(/* unknown type (const struct __AXUIElement) */ void *)arg1 options:(NSDictionary *)arg2 error:(id *)arg3;
@end

#endif
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 130000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 140000

#import "Xcode_11_0_XCTAutomationSupport_CDStructures.h"
#import "Xcode_11_0_SharedHeader.h"
#import "Xcode_11_0_XCTAccessibilityFramework.h"
#import <Foundation/Foundation.h>

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTAccessibilityFramework : NSObject <XCTAccessibilityFramework>
{
    _Bool _allowsRemoteAccess;
    /* unknown type (struct __AXUIElement) */ void *_systemWideElement;
}

+ (void)initialize;
+ (void)_startAXServer;
@property /* unknown type (struct __AXUIElement) */ void *systemWideElement; // @synthesize systemWideElement=_systemWideElement;
@property _Bool allowsRemoteAccess; // @synthesize allowsRemoteAccess=_allowsRemoteAccess;
- (void)performWithAXTimeout:(double)arg1 block:(CDUnknownBlockType)arg2;
- (id)attributes:(id)arg1 forElement:(/* unknown type (struct __AXUIElement) */ void *)arg2 error:(id *)arg3;
- (long long)appOrientationForElement:(/* unknown type (struct __AXUIElement) */ void *)arg1 error:(id *)arg2;
- (struct CGRect)frameForElement:(/* unknown type (struct __AXUIElement) */ void *)arg1 error:(id *)arg2;
- (/* unknown type (const struct __AXUIElement) */ void *)mainWindowForElement:(/* unknown type (struct __AXUIElement) */ void *)arg1 error:(id *)arg2;
- (id)userTestingSnapshotForElement:(/* unknown type (struct __AXUIElement) */ void *)arg1 options:(id)arg2 error:(id *)arg3;
- (void)dealloc;
- (id)init;

// Remaining properties

@end

#endif