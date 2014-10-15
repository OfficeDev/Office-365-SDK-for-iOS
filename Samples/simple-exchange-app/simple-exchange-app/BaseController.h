/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import <office365_exchange_sdk/MSOEntityContainerClient.h>
#import <office365_odata_impl/MSODefaultDependencyResolver.h>
#import <office365_odata_impl/MSOOAuthCredentials.h>
#import <office365_odata_impl/MSOCredentialsImpl.h>

@interface BaseController : NSObject

-(void)getClient : (void (^) (MSOEntityContainerClient* ))callback;

@end
