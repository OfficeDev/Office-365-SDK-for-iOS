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

@class MSGraphServiceServicePrincipalFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceServicePrincipalCollectionFetcher.
*/

@protocol MSGraphServiceServicePrincipalCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceServicePrincipal> *servicePrincipals, MSODataException *error))callback;

-(id<MSGraphServiceServicePrincipalCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceServicePrincipalCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceServicePrincipalCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceServicePrincipalCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceServicePrincipalCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceServicePrincipalCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceServicePrincipalCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceServicePrincipalCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceServicePrincipalFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addServicePrincipal:(MSGraphServiceServicePrincipal* )entity withCallback:(void (^)(MSGraphServiceServicePrincipal *servicePrincipal, MSODataException *e))callback;

@end

@interface MSGraphServiceServicePrincipalCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceServicePrincipalCollectionFetcher>

@end