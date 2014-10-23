/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import <office365_drive_sdk/office365_drive_sdk.h>
#import <office365_odata_base/office365_odata_base.h>

@interface BaseController : NSObject

+(void)getClient : (void (^) (MSSharePointClient* ))callback;
+(UIActivityIndicatorView*)getSpinner : (UIView*)view;

@end