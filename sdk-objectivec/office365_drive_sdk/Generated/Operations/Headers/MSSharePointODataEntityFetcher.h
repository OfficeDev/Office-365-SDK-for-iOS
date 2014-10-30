#import "MSSharePointODataReadable.h"

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

/**
* The header for type MSSharePointODataEntityFetcher.
*/


@protocol MSSharePointODataEntityFetcher 

@required
-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataReadable>)parent : (Class) entityClass;

-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(id entity, NSError * error))callback;
-(NSURLSessionDataTask*) delete : (void (^)(id entity, NSError * error))callback;
-(NSURLSessionDataTask*) read:(void (^)(id entity, NSError * error))callback;
-(NSURLSessionDataTask*) oDataExecute:(id<MSODataURL>)path :(NSData *)content :(MSHttpVerb)verb :(void (^)(id<MSResponse>, NSError *))callback;

-(id<MSDependencyResolver>) getResolver;

@optional

-(id) getOperations;

@end

@interface MSSharePointODataEntityFetcher : MSSharePointODataReadable<MSSharePointODataEntityFetcher>

@end
