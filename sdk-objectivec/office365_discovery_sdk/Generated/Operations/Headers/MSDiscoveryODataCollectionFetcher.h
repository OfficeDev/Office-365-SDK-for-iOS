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

#import "MSDiscoveryODataReadable.h"
#import "MSDiscoveryODataEntityFetcher.h"
#import <office365_odata_base/MSDependencyResolver.h>
/**
* The header for type MSDiscoveryODataCollectionFetcher.
*/

@interface MSDiscoveryODataCollectionFetcher : MSDiscoveryODataReadable

-(NSURLSessionDataTask *)read:(void (^)(id entity, NSError *error))callback;

-(id)initWith:(NSString *)urlComponent :(id<MSDiscoveryODataReadable>)parent : (Class)entityClass;
-(MSDiscoveryODataCollectionFetcher*)select : (NSString*) params;
-(MSDiscoveryODataCollectionFetcher*)filter : (NSString*) params;
-(MSDiscoveryODataCollectionFetcher*)top : (int) value;
-(MSDiscoveryODataCollectionFetcher*)expand : (NSString*) value;
-(NSURLSessionDataTask*)oDataExecute : (id<MSODataURL>) path : (NSData*) content : (MSHttpVerb) verb :(void (^)(id<MSResponse>, NSError *))callback;
-(id<MSDependencyResolver>)getResolver;
-(NSURLSessionDataTask*)add : (id) entity :(void (^)(id result, NSError* error))callback;
-(MSDiscoveryODataEntityFetcher*)getById : (NSString*) Id;

@end
