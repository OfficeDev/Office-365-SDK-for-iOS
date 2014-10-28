/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDiscoveryODataEntityFetcher.h"

/**
* The header for type MSDiscoveryODataMediaEntityFetcher.
*/

@interface MSDiscoveryODataMediaEntityFetcher : MSDiscoveryODataEntityFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSDiscoveryODataExecutable>)parent;
-(NSURLSessionDataTask*) getContent:(void (^)(NSData* content, NSError * error))callback;
-(NSURLSessionDataTask*) putContent:(NSData*)content :(void (^)(NSInteger result, NSError * error))callback;

@end
