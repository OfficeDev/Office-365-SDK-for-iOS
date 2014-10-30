/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

#import "MSDiscoveryODataEntityFetcher.h"

/**
* The header for type MSDiscoveryODataMediaEntityFetcher.
*/

@interface MSDiscoveryODataMediaEntityFetcher : MSDiscoveryODataEntityFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSDiscoveryODataReadable>)parent;
-(NSURLSessionDataTask*) getContent:(void (^)(NSData* content, NSError * error))callback;
-(NSURLSessionDataTask*) putContent:(NSData*)content :(void (^)(NSInteger result, NSError * error))callback;

@end
