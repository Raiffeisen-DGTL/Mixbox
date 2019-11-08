#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 120200 && __IPHONE_OS_VERSION_MAX_ALLOWED < 120400

#import "Xcode_10_2_XCTest_CDStructures.h"
#import "Xcode_10_2_SharedHeader.h"
#import "Xcode_10_2_XCTElementSnapshotAttributeDataSource.h"
#import "Xcode_10_2_XCTElementSnapshotProvider.h"
#import "Xcode_10_2_XCUIAXNotificationHandling.h"
#import <Foundation/Foundation.h>

@class XCAccessibilityElement, XCElementSnapshot, XCUIApplicationProcess;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@protocol XCUIAccessibilityInterface <NSObject, XCUIAXNotificationHandling, XCTElementSnapshotAttributeDataSource, XCTElementSnapshotProvider>
@property(readonly) _Bool supportsAnimationsInactiveNotifications;
@property double AXTimeout;
- (XCAccessibilityElement *)accessibilityElementForElementAtPoint:(struct CGPoint)arg1 error:(id *)arg2;
- (void)performWhenMenuOpens:(XCAccessibilityElement *)arg1 block:(void (^)(void))arg2;
- (void)removeObserver:(id)arg1 forAXNotification:(NSString *)arg2;
- (id)addObserverForAXNotification:(NSString *)arg1 handler:(void (^)(XCAccessibilityElement *, NSDictionary *))arg2;
- (void)registerForAXNotificationsForApplicationWithPID:(int)arg1 completion:(void (^)(_Bool, NSError *))arg2;
- (NSArray *)localizableStringsDataForActiveApplications;
- (_Bool)enableFauxCollectionViewCells:(id *)arg1;
- (void)notifyWhenViewControllerViewDidDisappearReply:(void (^)(NSDictionary *, NSError *))arg1;
- (void)notifyWhenViewControllerViewDidAppearReply:(void (^)(NSDictionary *, NSError *))arg1;
- (void)notifyWhenNoAnimationsAreActiveForApplication:(XCUIApplicationProcess *)arg1 reply:(void (^)(NSDictionary *, NSError *))arg2;
- (void)notifyWhenEventLoopIsIdleForApplication:(XCUIApplicationProcess *)arg1 reply:(void (^)(NSDictionary *, NSError *))arg2;
- (void)notifyOnNextOccurrenceOfUserTestingEvent:(NSString *)arg1 handler:(void (^)(NSDictionary *, NSError *))arg2;
- (_Bool)cachedAccessibilityLoadedValueForPID:(int)arg1;
- (_Bool)performAction:(int)arg1 onElement:(XCAccessibilityElement *)arg2 value:(id)arg3 error:(id *)arg4;
- (id)parameterizedAttribute:(NSString *)arg1 forElement:(XCAccessibilityElement *)arg2 parameter:(id)arg3 error:(id *)arg4;
- (_Bool)setAttribute:(NSString *)arg1 value:(id)arg2 element:(XCAccessibilityElement *)arg3 outError:(id *)arg4;
- (XCAccessibilityElement *)hitTestElement:(XCElementSnapshot *)arg1 withPoint:(struct CGPoint)arg2 error:(id *)arg3;
- (NSArray *)interruptingUIElementsAffectingSnapshot:(XCElementSnapshot *)arg1;
- (XCElementSnapshot *)snapshotForElement:(XCAccessibilityElement *)arg1 attributes:(NSArray *)arg2 parameters:(NSDictionary *)arg3 error:(id *)arg4;
- (_Bool)loadAccessibility:(id *)arg1;
@end

#endif
