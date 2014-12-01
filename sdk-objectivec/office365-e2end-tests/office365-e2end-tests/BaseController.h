/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import <office365_odata_base/office365_odata_base.h>
#import <office365_exchange_sdk/office365_exchange_sdk.h>
#import "MSDiscoveryClient.h"
#import <office365_files_sdk/office365_files_sdk.h>
#import <office365_directory_sdk/office365_directory_sdk.h>

@interface BaseController : NSObject

-(void)getMailClient : (void (^) (MSOutlookClient* c))callback;
-(void)getSharePointClient : (void (^) (MSSharePointClient* c))callback;
-(void)getDiscoveryClient : (void (^) (MSDiscoveryClient* c))callback;
@end
