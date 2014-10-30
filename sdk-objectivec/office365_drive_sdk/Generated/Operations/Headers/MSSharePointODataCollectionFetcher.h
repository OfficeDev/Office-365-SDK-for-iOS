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

#import "MSSharePointODataReadable.h"
#import "MSSharePointODataEntityFetcher.h"
#import <office365_odata_base/MSDependencyResolver.h>
/**
* The header for type MSSharePointODataCollectionFetcher.
*/

@interface MSSharePointODataCollectionFetcher : MSSharePointODataReadable

-(NSURLSessionDataTask *)read:(void (^)(id entity, NSError *error))callback;

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataReadable>)parent : (Class)entityClass;
-(MSSharePointODataCollectionFetcher*)select : (NSString*) params;
-(MSSharePointODataCollectionFetcher*)filter : (NSString*) params;
-(MSSharePointODataCollectionFetcher*)top : (int) value;
-(MSSharePointODataCollectionFetcher*)expand : (NSString*) value;
-(NSURLSessionDataTask*)oDataExecute : (id<MSODataURL>) path : (NSData*) content : (MSHttpVerb) verb :(void (^)(id<MSResponse>, NSError *))callback;
-(id<MSDependencyResolver>)getResolver;
-(NSURLSessionDataTask*)add : (id) entity :(void (^)(id result, NSError* error))callback;
-(MSSharePointODataEntityFetcher*)getById : (NSString*) Id;

@end
