#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 120200 && __IPHONE_OS_VERSION_MAX_ALLOWED < 120400

#import "Xcode_10_2_XCTest_CDStructures.h"
#import "Xcode_10_2_SharedHeader.h"
#import <Foundation/Foundation.h>

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@protocol XCUIRemoteSiriInterface <NSObject>
@property(readonly) _Bool supportsInjectingVoiceRecognitionAudioInputPaths;
@property(readonly) _Bool supportsStartingSiriUIRequestWithAudioFileURL;
- (void)injectVoiceRecognitionAudioInputPaths:(NSArray *)arg1 completion:(void (^)(_Bool, NSError *))arg2;
- (void)injectAssistantRecognitionStrings:(NSArray *)arg1 completion:(void (^)(_Bool, NSError *))arg2;
- (void)startSiriUIRequestWithAudioFileURL:(NSURL *)arg1 completion:(void (^)(_Bool, NSError *))arg2;
- (void)startSiriUIRequestWithText:(NSString *)arg1 completion:(void (^)(_Bool, NSError *))arg2;
- (void)requestSiriEnabledStatus:(void (^)(_Bool, NSError *))arg1;
@end

#endif
