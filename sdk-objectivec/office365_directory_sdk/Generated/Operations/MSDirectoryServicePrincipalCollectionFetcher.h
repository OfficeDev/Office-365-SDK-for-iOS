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
#import "MSDirectoryServicePrincipal.h"
#import "MSDirectoryServicePrincipalFetcher.h"

/**
* The header for type MSDirectoryServicePrincipalCollectionFetcher.
*/

@protocol MSDirectoryServicePrincipalCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryServicePrincipal> *servicePrincipals, NSError *error))callback;
-(MSDirectoryServicePrincipalFetcher*)select : (NSString*) params;
-(MSDirectoryServicePrincipalFetcher*)filter : (NSString*) params;
-(MSDirectoryServicePrincipalFetcher*)top : (int) value;
-(MSDirectoryServicePrincipalFetcher*)skip : (int) value;
-(MSDirectoryServicePrincipalFetcher*)expand : (NSString*) value;
-(MSDirectoryServicePrincipalFetcher*)orderBy : (NSString*) params;

@end

@interface MSDirectoryServicePrincipalCollectionFetcher : MSODataCollectionFetcher<MSDirectoryServicePrincipalCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addServicePrincipal:(MSDirectoryServicePrincipal* )entity withCallback:(void (^)(MSDirectoryServicePrincipal *servicePrincipal, NSError *e))callback;

-(MSDirectoryServicePrincipalFetcher*)getById:(NSString *)Id;

@end