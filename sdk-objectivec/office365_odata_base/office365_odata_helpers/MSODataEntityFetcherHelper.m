/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcherHelper.h"
#import "MSODataURL.h"

@implementation MSODataEntityFetcherHelper

+ (void)setPathForCollectionsWithUrl:(id<MSODataURL>)url
                                 top:(int)top
                                skip:(int)skip
                              select:(NSString *)select
                              expand:(NSString *)expand
                              filter:(NSString *)filter
                             orderby:(NSString *)orderBy
                              search:(NSString *)search {
    
    if (top > -1) {
        
        [url addQueryStringParameter:@"$top" value:[[NSString alloc] initWithFormat:@"%d", top]];
    }
    
    if (skip > -1) {
        
        [url addQueryStringParameter:@"$skip" value:[[NSString alloc] initWithFormat:@"%d", skip]];
    }
    
    if (select != nil) {
        
        [url addQueryStringParameter:@"$select" value:select];
    }
    
    if (expand != nil) {
        
        [url addQueryStringParameter:@"$expand" value:expand];
    }
    
    if (filter!= nil) {
        
        [url addQueryStringParameter:@"$filter" value:filter];
    }
    
    if (orderBy != nil) {
        
        [url addQueryStringParameter:@"$orderBy" value:orderBy];
    }
    
    if (search != nil) {
        
        [url addQueryStringParameter:@"$search" value:search];
    }
}

@end