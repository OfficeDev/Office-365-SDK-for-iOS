/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>

#import <office365_exchange_sdk/office365_exchange_sdk-Prefix.pch>
#import <office365_exchange_sdk/office365_exchange_sdk.h>
#import <office365_odata_base/office365_odata_base.h>

@interface BaseController : NSObject

-(void)getClient : (void (^) (MSOEntityContainerClient* ))callback;

@end