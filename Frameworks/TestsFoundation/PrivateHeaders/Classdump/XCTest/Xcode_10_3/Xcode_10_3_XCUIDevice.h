#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 120400 && __IPHONE_OS_VERSION_MAX_ALLOWED < 130000

#import "Xcode_10_3_XCTest_CDStructures.h"
#import "Xcode_10_3_SharedHeader.h"
#import "Xcode_10_3_XCUIIOSDevice.h"
#import <Foundation/Foundation.h>
#import <XCTest/XCUIDevice.h>

@protocol XCUIAccessibilityInterface, XCUIApplicationAutomationSessionProviding, XCUIApplicationManaging, XCUIApplicationMonitor, XCUIDeviceEventAndStateInterface, XCUIEventSynthesizing, XCUIScreenDataSource, XCUIXcodeApplicationManaging;

@class XCUIScreen, XCUISiriService, XCUITestContext;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCUIDevice ()
{
    _Bool _isLocal;
    _Bool _isSimulatorDevice;
    long long _platform;
    id <XCUIAccessibilityInterface> _accessibilityInterface;
    id <XCUIApplicationMonitor> _applicationMonitor;
    id <XCUIEventSynthesizing> _eventSynthesizer;
    id <XCUIApplicationManaging> _platformApplicationManager;
    id <XCUIXcodeApplicationManaging> _xcodeApplicationManager;
    id <XCUIDeviceEventAndStateInterface> _deviceEventAndStateInterface;
    id <XCUIApplicationAutomationSessionProviding> _applicationAutomationSessionProvider;
    XCUISiriService *_siriService;
    id <XCUIScreenDataSource> _screenDataSource;
    NSString *_uniqueIdentifier;
    XCUITestContext *_testContext;
}

+ (id)localDevice;
@property(readonly) XCUITestContext *testContext; // @synthesize testContext=_testContext;
@property(readonly) _Bool isSimulatorDevice; // @synthesize isSimulatorDevice=_isSimulatorDevice;
@property(readonly) NSString *uniqueIdentifier; // @synthesize uniqueIdentifier=_uniqueIdentifier;
@property(readonly) id <XCUIScreenDataSource> screenDataSource; // @synthesize screenDataSource=_screenDataSource;
@property(readonly) id <XCUIApplicationAutomationSessionProviding> applicationAutomationSessionProvider; // @synthesize applicationAutomationSessionProvider=_applicationAutomationSessionProvider;
@property(readonly) id <XCUIDeviceEventAndStateInterface> deviceEventAndStateInterface; // @synthesize deviceEventAndStateInterface=_deviceEventAndStateInterface;
@property(readonly) id <XCUIXcodeApplicationManaging> xcodeApplicationManager; // @synthesize xcodeApplicationManager=_xcodeApplicationManager;
@property(readonly) id <XCUIApplicationManaging> platformApplicationManager; // @synthesize platformApplicationManager=_platformApplicationManager;
@property(readonly) id <XCUIEventSynthesizing> eventSynthesizer; // @synthesize eventSynthesizer=_eventSynthesizer;
@property(readonly) id <XCUIApplicationMonitor> applicationMonitor; // @synthesize applicationMonitor=_applicationMonitor;
@property(readonly) id <XCUIAccessibilityInterface> accessibilityInterface; // @synthesize accessibilityInterface=_accessibilityInterface;
@property(readonly) long long platform; // @synthesize platform=_platform;
@property(readonly) _Bool isLocal; // @synthesize isLocal=_isLocal;
- (void)rotateDigitalCrown:(double)arg1 velocity:(double)arg2;
- (void)pressLockButton;
- (void)holdHomeButtonForDuration:(double)arg1;

- (void)_silentPressButton:(long long)arg1;
- (void)_setOrientation:(long long)arg1;
- (id)init;
- (_Bool)isEqual:(id)arg1;
@property(readonly) XCUIScreen *mainScreen;
@property(readonly, copy) NSArray *screens;
- (id)mainScreenOrError:(id *)arg1;
- (id)screensOrError:(id *)arg1;
- (_Bool)performDeviceEvent:(id)arg1 error:(id *)arg2;
- (id)initLocalDeviceWithPlatform:(long long)arg1;

// Remaining properties

@end

#endif