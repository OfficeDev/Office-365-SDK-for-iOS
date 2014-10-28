/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryODataEntityFetcher.h"

/**
* The header for type MSDirectoryODataMediaEntityFetcher.
*/

@interface MSDirectoryODataMediaEntityFetcher : MSDirectoryODataEntityFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;
-(NSURLSessionDataTask*) getContent:(void (^)(NSData* content, NSError * error))callback;
-(NSURLSessionDataTask*) putContent:(NSData*)content :(void (^)(NSInteger result, NSError * error))callback;

@end
