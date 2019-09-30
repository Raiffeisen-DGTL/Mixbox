#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 130000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 140000

#import "Xcode_11_0_XCTAutomationSupport_CDStructures.h"
#import "Xcode_11_0_SharedHeader.h"
#import <Foundation/Foundation.h>

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTSerializedTransportWrapper2 : NSObject <NSSecureCoding>
{
    NSObject *_serializedTransport;
}

+ (_Bool)supportsSecureCoding;
@property(readonly) NSObject *serializedTransport; // @synthesize serializedTransport=_serializedTransport;
- (void)encodeWithCoder:(id)arg1;
- (id)initWithCoder:(id)arg1;
- (id)initWithSerializedTransport:(id)arg1;

@end

#endif