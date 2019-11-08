#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 120400 && __IPHONE_OS_VERSION_MAX_ALLOWED < 130000

#import "Xcode_10_3_XCTAutomationSupport_CDStructures.h"
#import "Xcode_10_3_SharedHeader.h"
#import "Xcode_10_3_XCTMatchingElementIterator.h"

@class XCTElementFilteringTransformer;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTFilteringTransformerIterator : XCTMatchingElementIterator
{
    NSEnumerator *_inputEnumerator;
    XCTElementFilteringTransformer *_filteringTransformer;
}

@property(readonly) XCTElementFilteringTransformer *filteringTransformer; // @synthesize filteringTransformer=_filteringTransformer;
- (id)nextMatch;
- (id)initWithInput:(id)arg1 filteringTransformer:(id)arg2;

@end

#endif