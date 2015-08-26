/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import <files_services/files_services.h>


@interface BaseController : NSObject

+(void)getClient : (void (^) (MSSharePointClient *))callback;
+(UIActivityIndicatorView*)getSpinner : (UIView*)view;

@end