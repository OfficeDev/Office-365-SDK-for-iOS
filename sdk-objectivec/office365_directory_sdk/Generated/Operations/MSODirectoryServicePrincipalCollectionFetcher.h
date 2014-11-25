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
#import "MSODirectoryServicePrincipal.h"
#import "MSODirectoryServicePrincipalFetcher.h"

/**
* The header for type MSODirectoryServicePrincipalCollectionFetcher.
*/

@protocol MSODirectoryServicePrincipalCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSODirectoryServicePrincipal> *servicePrincipals, NSError *error))callback;

@end

@interface MSODirectoryServicePrincipalCollectionFetcher : MSODataCollectionFetcher<MSODirectoryServicePrincipalCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSODirectoryServicePrincipal* )entity withCallback:(void (^)(MSODirectoryServicePrincipal *servicePrincipal, NSError *e))callback;

-(MSODirectoryServicePrincipalFetcher*)getById:(NSString *)Id;

@end