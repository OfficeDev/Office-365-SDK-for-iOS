/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataEntityFetcher.h"

/**
* The header for type MSOODataMediaEntityFetcher.
*/

@interface MSOODataMediaEntityFetcher : MSOODataEntityFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*) getContent:(void (^)(NSData* content, NSError * error))callback;
-(NSURLSessionDataTask*) putContent:(NSData*)content :(void (^)(int result, NSError * error))callback;

@end
