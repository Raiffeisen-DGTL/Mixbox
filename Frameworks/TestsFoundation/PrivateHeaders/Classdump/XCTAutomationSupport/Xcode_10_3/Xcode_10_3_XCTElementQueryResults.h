#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 120400 && __IPHONE_OS_VERSION_MAX_ALLOWED < 130000

#import "Xcode_10_3_XCTAutomationSupport_CDStructures.h"
#import "Xcode_10_3_SharedHeader.h"
#import <Foundation/Foundation.h>

@class XCElementSnapshot;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTElementQueryResults : NSObject <NSSecureCoding>
{
    XCElementSnapshot *_rootElement;
    NSOrderedSet *_matchingElements;
    NSSet *_remoteElements;
}

+ (_Bool)supportsSecureCoding;
@property(readonly, copy) NSSet *remoteElements; // @synthesize remoteElements=_remoteElements;
@property(readonly, copy) NSOrderedSet *matchingElements; // @synthesize matchingElements=_matchingElements;
@property(readonly) XCElementSnapshot *rootElement; // @synthesize rootElement=_rootElement;
- (void)encodeWithCoder:(id)arg1;
- (id)initWithCoder:(id)arg1;
- (id)initWithRootElement:(id)arg1 matchingElements:(id)arg2 remoteElements:(id)arg3;

@end

#endif