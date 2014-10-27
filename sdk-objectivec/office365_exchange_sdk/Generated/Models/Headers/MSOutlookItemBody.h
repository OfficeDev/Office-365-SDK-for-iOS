/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookBodyType.h"

#import <Foundation/Foundation.h>
#import "MSOutlookProtocols.h"


/**
* The header for type ItemBody.
*/

@interface MSOutlookItemBody : NSObject

@property NSString *$$__ODataType;
@property MSOutlookBodyType *ContentType;
@property NSString *Content;

@end