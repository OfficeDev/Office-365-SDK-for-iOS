//
//  MSOEntityFetcherHelper.h
//  office365_exchange_helpers
//
//  Created by Gustavo on 10/16/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <office365_odata_interfaces/MSOODataURL.h>

@interface MSOEntityFetcherHelper : NSObject

+(void)setPathForCollections : (id<MSOODataURL>) url : (NSString*) urlComponent : (int) top : (int) skip : (NSString*) select : (NSString*) expand : (NSString*)  filter;

/**
 * Sets selector url.
 *
 * @param url the url
 * @param urlComponent the url component
 * @param selectedId the selected id
 */
+(void)setSelectorUrl :(id<MSOODataURL>) url : (NSString*) urlComponent : (NSString*) selectedId;

@end
