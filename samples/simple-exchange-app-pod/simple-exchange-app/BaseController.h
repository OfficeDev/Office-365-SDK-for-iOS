/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import <office365_exchange_sdk/office365_exchange_sdk.h>


@interface BaseController : NSObject

+(void)getClient : (void (^) (MSOutlookClient* ))callback;

@end
