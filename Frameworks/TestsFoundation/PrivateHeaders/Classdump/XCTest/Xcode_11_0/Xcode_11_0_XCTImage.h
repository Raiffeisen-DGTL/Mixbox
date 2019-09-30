#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 130000 && __IPHONE_OS_VERSION_MAX_ALLOWED < 140000

#import "Xcode_11_0_XCTest_CDStructures.h"
#import "Xcode_11_0_SharedHeader.h"
#import <Foundation/Foundation.h>

@class UIImage, XCTImageImplementation, _XCTImageImplementation;

//
//     Generated by class-dump 3.5 (64 bit).
//
//     class-dump is Copyright (C) 1997-1998, 2000-2001, 2004-2013 by Steve Nygard.
//

@interface XCTImage : NSObject <NSCopying>
{
    _XCTImageImplementation *_internalImplementation;
}

+ (id)_dataForImage:(id)arg1 quality:(long long)arg2;
+ (double)_scaleForImage:(id)arg1;
+ (id)UTIForQuality:(long long)arg1;
+ (double)compressionQualityForQuality:(long long)arg1;
+ (id)emptyImageWithSize:(struct CGSize)arg1;
@property(retain) _XCTImageImplementation *internalImplementation; // @synthesize internalImplementation=_internalImplementation;
- (id)debugQuickLookObject;
- (void)_ensureImage;
@property(readonly) double scale;
@property(copy) NSString *name;
- (id)attachment;
@property(readonly, copy) UIImage *image;
@property(readonly, copy) NSData *data;
- (id)dataWithQuality:(long long)arg1;
- (id)initWithData:(id)arg1 scale:(double)arg2;
- (id)initWithImage:(id)arg1;
- (id)copyWithZone:(struct _NSZone *)arg1;
- (id)_init;

@end

#endif