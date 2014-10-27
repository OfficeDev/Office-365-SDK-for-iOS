/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"

/**
* The header for type MSODataMediaEntityFetcher.
*/

@interface MSODataMediaEntityFetcher : MSODataEntityFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;
-(NSURLSessionDataTask*) getContent:(void (^)(NSData* content, NSError * error))callback;
-(NSURLSessionDataTask*) putContent:(NSData*)content :(void (^)(int result, NSError * error))callback;

@end
