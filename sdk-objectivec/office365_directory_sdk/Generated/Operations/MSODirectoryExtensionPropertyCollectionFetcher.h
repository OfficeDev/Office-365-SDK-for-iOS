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
#import "MSODirectoryExtensionProperty.h"
#import "MSODirectoryExtensionPropertyFetcher.h"

/**
* The header for type MSODirectoryExtensionPropertyCollectionFetcher.
*/

@protocol MSODirectoryExtensionPropertyCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSODirectoryExtensionProperty> *extensionPropertys, NSError *error))callback;

@end

@interface MSODirectoryExtensionPropertyCollectionFetcher : MSODataCollectionFetcher<MSODirectoryExtensionPropertyCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSODirectoryExtensionProperty* )entity withCallback:(void (^)(MSODirectoryExtensionProperty *extensionProperty, NSError *e))callback;

-(MSODirectoryExtensionPropertyFetcher*)getById:(NSString *)Id;

@end