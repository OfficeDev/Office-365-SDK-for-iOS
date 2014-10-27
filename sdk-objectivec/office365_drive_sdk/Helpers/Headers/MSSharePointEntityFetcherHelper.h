/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import <office365_odata_base/office365_odata_base.h>

@interface MSSharePointEntityFetcherHelper : NSObject

+(void)setPathForCollections : (id<MSODataURL>) url : (NSString*) urlComponent : (int) top : (int) skip : (NSString*) select : (NSString*) expand : (NSString*)  filter;

@end