/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import <office365_discovery_sdk/office365_discovery_sdk.h>
#import <office365_odata_base/MSDefaultDependencyResolver.h>
#import <office365_odata_base/MSOAuthCredentials.h>
#import <office365_odata_base/MSCredentialsImpl.h>

@interface BaseController : NSObject

+(void)getClient : (void (^) (MSDiscoveryClient* ))callback;
+(UIActivityIndicatorView*)getSpinner : (UIView*)view;

@end