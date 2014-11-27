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
#import "MSDirectoryDirectoryLinkChange.h"
#import "MSDirectoryDirectoryLinkChangeFetcher.h"

/**
* The header for type MSDirectoryDirectoryLinkChangeCollectionFetcher.
*/

@protocol MSDirectoryDirectoryLinkChangeCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryDirectoryLinkChange> *directoryLinkChanges, NSError *error))callback;
-(MSDirectoryDirectoryLinkChangeFetcher*)select : (NSString*) params;
-(MSDirectoryDirectoryLinkChangeFetcher*)filter : (NSString*) params;
-(MSDirectoryDirectoryLinkChangeFetcher*)top : (int) value;
-(MSDirectoryDirectoryLinkChangeFetcher*)skip : (int) value;
-(MSDirectoryDirectoryLinkChangeFetcher*)expand : (NSString*) value;
-(MSDirectoryDirectoryLinkChangeFetcher*)orderBy : (NSString*) params;

@end

@interface MSDirectoryDirectoryLinkChangeCollectionFetcher : MSODataCollectionFetcher<MSDirectoryDirectoryLinkChangeCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addDirectoryLinkChange:(MSDirectoryDirectoryLinkChange* )entity withCallback:(void (^)(MSDirectoryDirectoryLinkChange *directoryLinkChange, NSError *e))callback;

-(MSDirectoryDirectoryLinkChangeFetcher*)getById:(NSString *)Id;

@end