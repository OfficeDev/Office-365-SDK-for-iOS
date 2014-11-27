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
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryExtensionProperty> *extensionPropertys, NSError *error))callback;
-(MSDirectoryExtensionPropertyFetcher*)select : (NSString*) params;
-(MSDirectoryExtensionPropertyFetcher*)filter : (NSString*) params;
-(MSDirectoryExtensionPropertyFetcher*)top : (int) value;
-(MSDirectoryExtensionPropertyFetcher*)skip : (int) value;
-(MSDirectoryExtensionPropertyFetcher*)expand : (NSString*) value;
-(MSDirectoryExtensionPropertyFetcher*)orderBy : (NSString*) params;

@end

@interface MSDirectoryExtensionPropertyCollectionFetcher : MSODataCollectionFetcher<MSDirectoryExtensionPropertyCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addExtensionProperty:(MSDirectoryExtensionProperty* )entity withCallback:(void (^)(MSDirectoryExtensionProperty *extensionProperty, NSError *e))callback;

-(MSDirectoryExtensionPropertyFetcher*)getById:(NSString *)Id;

@end