//
//  ItemBody.h
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>

#import "BodyType.h"

@interface ItemBody : NSObject

@property enum BodyType * ContentType;
@property NSString * Content;

@end