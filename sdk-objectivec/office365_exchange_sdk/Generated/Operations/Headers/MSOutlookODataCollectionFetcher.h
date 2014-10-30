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

#import "MSOutlookODataReadable.h"
#import "MSOutlookODataEntityFetcher.h"
#import <office365_odata_base/MSDependencyResolver.h>
/**
* The header for type MSOutlookODataCollectionFetcher.
*/

@interface MSOutlookODataCollectionFetcher : MSOutlookODataReadable

-(NSURLSessionDataTask *)read:(void (^)(id entity, NSError *error))callback;

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataReadable>)parent : (Class)entityClass;
-(MSOutlookODataCollectionFetcher*)select : (NSString*) params;
-(MSOutlookODataCollectionFetcher*)filter : (NSString*) params;
-(MSOutlookODataCollectionFetcher*)top : (int) value;
-(MSOutlookODataCollectionFetcher*)expand : (NSString*) value;
-(NSURLSessionDataTask*)oDataExecute : (id<MSODataURL>) path : (NSData*) content : (MSHttpVerb) verb :(void (^)(id<MSResponse>, NSError *))callback;
-(id<MSDependencyResolver>)getResolver;
-(NSURLSessionDataTask*)add : (id) entity :(void (^)(id result, NSError* error))callback;
-(MSOutlookODataEntityFetcher*)getById : (NSString*) Id;

@end
