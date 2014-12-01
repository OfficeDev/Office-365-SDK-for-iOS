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

#import <office365_odata_base/office365_odata_base.h>
#import "MSDirectoryExtensionProperty.h"
#import "MSDirectoryExtensionPropertyFetcher.h"

/**
* The header for type MSDirectoryExtensionPropertyCollectionFetcher.
*/

@protocol MSDirectoryExtensionPropertyCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryExtensionProperty> *extensionPropertys, MSODataException *error))callback;

-(id<MSDirectoryExtensionPropertyCollectionFetcher>)select : (NSString*) params;
-(id<MSDirectoryExtensionPropertyCollectionFetcher>)filter : (NSString*) params;
-(id<MSDirectoryExtensionPropertyCollectionFetcher>)top : (int) value;
-(id<MSDirectoryExtensionPropertyCollectionFetcher>)skip : (int) value;
-(id<MSDirectoryExtensionPropertyCollectionFetcher>)expand : (NSString*) value;
-(id<MSDirectoryExtensionPropertyCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSDirectoryExtensionPropertyCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryExtensionPropertyCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSDirectoryExtensionPropertyCollectionFetcher : MSODataCollectionFetcher<MSDirectoryExtensionPropertyCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSDirectoryExtensionPropertyFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addExtensionProperty:(MSDirectoryExtensionProperty* )entity withCallback:(void (^)(MSDirectoryExtensionProperty *extensionProperty, MSODataException *e))callback;

@end