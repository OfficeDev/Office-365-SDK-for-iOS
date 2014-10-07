/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "Protocols.h"
@class BodyType;


@interface ItemBody : NSObject	

@property BodyType *ContentType;
@property NSString *Content;

@end