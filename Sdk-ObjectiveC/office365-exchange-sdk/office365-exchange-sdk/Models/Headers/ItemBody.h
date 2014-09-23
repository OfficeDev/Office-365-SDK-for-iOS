//  
//
//  Copyright (c) 2014 Microsoft Open Technologies, Inc.
//  All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Protocols.h"



@class BodyType;

@interface ItemBody : NSObject	


@property BodyType *ContentType;

@property NSString *Content;


@end