/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>

@protocol MSODataURL;

@interface MSODataEntityFetcherHelper : NSObject

+ (void)setPathForCollectionsWithUrl:(id<MSODataURL>)url
                                 top:(int)top
                                skip:(int)skip
                              select:(NSString *)select
                              expand:(NSString *)expand
                              filter:(NSString *)filter
                             orderby:(NSString *)orderBy
                              search:(NSString *)search;

@end