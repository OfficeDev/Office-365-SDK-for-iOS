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

#import "MSSharePointODataEntityFetcher.h"

/**
* The header for type MSSharePointODataMediaEntityFetcher.
*/

@interface MSSharePointODataMediaEntityFetcher : MSSharePointODataEntityFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataReadable>)parent;
-(NSURLSessionDataTask*) getContent:(void (^)(NSData* content, NSError * error))callback;
-(NSURLSessionDataTask*) putContent:(NSData*)content :(void (^)(NSInteger result, NSError * error))callback;

@end
