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

@class MSGraphServiceExtensionPropertyFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceExtensionPropertyCollectionFetcher.
*/

@protocol MSGraphServiceExtensionPropertyCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceExtensionProperty> *extensionPropertys, MSODataException *error))callback;

-(id<MSGraphServiceExtensionPropertyCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceExtensionPropertyCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceExtensionPropertyCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceExtensionPropertyCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceExtensionPropertyCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceExtensionPropertyCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceExtensionPropertyCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceExtensionPropertyCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceExtensionPropertyFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addExtensionProperty:(MSGraphServiceExtensionProperty* )entity withCallback:(void (^)(MSGraphServiceExtensionProperty *extensionProperty, MSODataException *e))callback;

@end

@interface MSGraphServiceExtensionPropertyCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceExtensionPropertyCollectionFetcher>

@end