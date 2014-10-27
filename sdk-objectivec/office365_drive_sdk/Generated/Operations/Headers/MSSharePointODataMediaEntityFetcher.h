/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointODataEntityFetcher.h"

/**
* The header for type MSSharePointODataMediaEntityFetcher.
*/

@interface MSSharePointODataMediaEntityFetcher : MSSharePointODataEntityFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataExecutable>)parent;
-(NSURLSessionDataTask*) getContent:(void (^)(NSData* content, NSError * error))callback;
-(NSURLSessionDataTask*) putContent:(NSData*)content :(void (^)(int result, NSError * error))callback;

@end
