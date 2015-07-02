/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "discovery_services.h"
@interface BaseController : NSObject

+(void)getClient : (void (^) (MSDiscoveryClient* ))callback;
+(UIActivityIndicatorView*)getSpinner : (UIView*)view;

@end