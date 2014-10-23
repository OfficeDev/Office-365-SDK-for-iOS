/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSBodyType.h"

#import <Foundation/Foundation.h>
#import "MSProtocols.h"


/**
* The header for type ItemBody.
*/

@interface MSItemBody : NSObject

@property MSBodyType *ContentType;
@property NSString *Content;

@end