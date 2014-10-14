/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import <office365_exchange_sdk/MSOEntityContainerClient.h>
#import <office365_odata_impl/MSODefaultDependencyResolver.h>
#import <office365_odata_impl/MSOBasicCredentials.h>
#import <office365_odata_impl/MSOCredentialsImpl.h>

@interface BaseController : NSObject

-(MSOEntityContainerClient*)getClient;

@end
