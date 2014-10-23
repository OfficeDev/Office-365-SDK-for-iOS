//
//  MSOEntityFetcherHelper.m
//  office365_exchange_helpers
//
//  Created by Gustavo on 10/16/14.
//  Copyright (c) 2014 Microsoft. All rights reserved.
//

#import "MSOEntityFetcherHelper.h"
#import <office365_odata_base/office365_odata_interfaces.h>

@implementation MSOEntityFetcherHelper

/**
 * Sets path for collections.
 *
 * @param url the url
 * @param urlComponent the url component
 * @param top the top
 * @param skip the skip
 * @param select the select
 * @param expand the expand
 * @param filter the filter
 */
+(void)setPathForCollections : (id<MSOODataURL>) url : (NSString*) urlComponent : (int) top : (int) skip : (NSString*) select : (NSString*) expand : (NSString*)  filter {
    
    if (top > -1) {
        [url addQueryStringParameter:@"$top" :[[NSString alloc] initWithFormat:@"%d", top]];
    }
    
    if (skip > -1) {
        [url addQueryStringParameter:@"$skip" :[[NSString alloc] initWithFormat:@"%d", skip]];
    }
    
    if (select != nil) {
        [url addQueryStringParameter:@"$select" : select];
    }
    
    if (expand != nil) {
        [url addQueryStringParameter:@"$expand" : expand];
    }
    
    if (filter!= nil) {
        [url addQueryStringParameter:@"$filter" : filter];
    }
}

@end