#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 120400 && __IPHONE_OS_VERSION_MAX_ALLOWED < 130000

#import "Xcode_10_3_XCTest_CDStructures.h"
#import "Xcode_10_3_SharedHeader.h"
#import <Foundation/Foundation.h>

@class XCTAggregateSuiteRunStatistics;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTestConfiguration : NSObject <NSSecureCoding, NSCopying>
{
    _Bool _reportResultsToIDE;
    _Bool _testsDrivenByIDE;
    _Bool _disablePerformanceMetrics;
    _Bool _treatMissingBaselinesAsFailures;
    _Bool _reportActivities;
    _Bool _testsMustRunOnMainThread;
    _Bool _initializeForUITesting;
    _Bool _gatherLocalizableStringsData;
    _Bool _emitOSLogs;
    NSString *_absolutePath;
    NSString *_testBundleRelativePath;
    NSURL *_testBundleURL;
    NSSet *_testsToRun;
    NSSet *_testsToSkip;
    NSUUID *_sessionIdentifier;
    NSURL *_baselineFileURL;
    NSString *_baselineFileRelativePath;
    NSString *_targetApplicationPath;
    NSString *_targetApplicationBundleID;
    NSDictionary *_testApplicationDependencies;
    NSDictionary *_testApplicationUserOverrides;
    NSString *_productModuleName;
    NSDictionary *_targetApplicationEnvironment;
    NSArray *_targetApplicationArguments;
    XCTAggregateSuiteRunStatistics *_aggregateStatisticsBeforeCrash;
    NSString *_automationFrameworkPath;
    NSString *_bridgedProcessAutomationFrameworkPath;
    long long _systemAttachmentLifetime;
    long long _userAttachmentLifetime;
    long long _testExecutionOrdering;
    NSNumber *_randomExecutionOrderingSeed;
}

+ (id)configurationWithContentsOfFile:(id)arg1;
+ (id)activeTestConfiguration;
+ (void)setActiveTestConfiguration:(id)arg1;
+ (_Bool)supportsSecureCoding;
@property(retain) NSNumber *randomExecutionOrderingSeed; // @synthesize randomExecutionOrderingSeed=_randomExecutionOrderingSeed;
@property long long testExecutionOrdering; // @synthesize testExecutionOrdering=_testExecutionOrdering;
@property long long userAttachmentLifetime; // @synthesize userAttachmentLifetime=_userAttachmentLifetime;
@property long long systemAttachmentLifetime; // @synthesize systemAttachmentLifetime=_systemAttachmentLifetime;
@property _Bool emitOSLogs; // @synthesize emitOSLogs=_emitOSLogs;
@property(copy) NSString *bridgedProcessAutomationFrameworkPath; // @synthesize bridgedProcessAutomationFrameworkPath=_bridgedProcessAutomationFrameworkPath;
@property(copy) NSString *automationFrameworkPath; // @synthesize automationFrameworkPath=_automationFrameworkPath;
@property(copy) XCTAggregateSuiteRunStatistics *aggregateStatisticsBeforeCrash; // @synthesize aggregateStatisticsBeforeCrash=_aggregateStatisticsBeforeCrash;
@property(copy) NSArray *targetApplicationArguments; // @synthesize targetApplicationArguments=_targetApplicationArguments;
@property(copy) NSDictionary *targetApplicationEnvironment; // @synthesize targetApplicationEnvironment=_targetApplicationEnvironment;
@property _Bool gatherLocalizableStringsData; // @synthesize gatherLocalizableStringsData=_gatherLocalizableStringsData;
@property _Bool initializeForUITesting; // @synthesize initializeForUITesting=_initializeForUITesting;
@property _Bool testsMustRunOnMainThread; // @synthesize testsMustRunOnMainThread=_testsMustRunOnMainThread;
@property _Bool reportActivities; // @synthesize reportActivities=_reportActivities;
@property(copy) NSString *productModuleName; // @synthesize productModuleName=_productModuleName;
@property(copy) NSDictionary *testApplicationUserOverrides; // @synthesize testApplicationUserOverrides=_testApplicationUserOverrides;
@property(copy) NSDictionary *testApplicationDependencies; // @synthesize testApplicationDependencies=_testApplicationDependencies;
@property(copy) NSString *targetApplicationBundleID; // @synthesize targetApplicationBundleID=_targetApplicationBundleID;
@property(copy) NSString *targetApplicationPath; // @synthesize targetApplicationPath=_targetApplicationPath;
@property _Bool treatMissingBaselinesAsFailures; // @synthesize treatMissingBaselinesAsFailures=_treatMissingBaselinesAsFailures;
@property _Bool disablePerformanceMetrics; // @synthesize disablePerformanceMetrics=_disablePerformanceMetrics;
@property _Bool testsDrivenByIDE; // @synthesize testsDrivenByIDE=_testsDrivenByIDE;
@property _Bool reportResultsToIDE; // @synthesize reportResultsToIDE=_reportResultsToIDE;
@property(copy) NSString *baselineFileRelativePath; // @synthesize baselineFileRelativePath=_baselineFileRelativePath;
@property(copy, nonatomic) NSURL *baselineFileURL; // @synthesize baselineFileURL=_baselineFileURL;
@property(copy) NSUUID *sessionIdentifier; // @synthesize sessionIdentifier=_sessionIdentifier;
@property(copy) NSSet *testsToSkip; // @synthesize testsToSkip=_testsToSkip;
@property(copy) NSSet *testsToRun; // @synthesize testsToRun=_testsToRun;
@property(copy, nonatomic) NSURL *testBundleURL; // @synthesize testBundleURL=_testBundleURL;
@property(copy) NSString *testBundleRelativePath; // @synthesize testBundleRelativePath=_testBundleRelativePath;
@property(copy) NSString *absolutePath; // @synthesize absolutePath=_absolutePath;
@property(readonly) long long testMode;
- (_Bool)isEqual:(id)arg1;
- (unsigned long long)hash;
- (id)description;
- (_Bool)writeToFile:(id)arg1;
- (id)copyWithZone:(struct _NSZone *)arg1;
- (void)encodeWithCoder:(id)arg1;
- (id)initWithCoder:(id)arg1;
- (id)init;

@end

#endif