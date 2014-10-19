/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOBodyType.h"

#import <Foundation/Foundation.h>
#import "MSOProtocols.h"


/**
* The header for type ItemBody.
*/

@interface MSOItemBody : NSObject

@property MSOBodyType *ContentType;
@property NSString *Content;

@end