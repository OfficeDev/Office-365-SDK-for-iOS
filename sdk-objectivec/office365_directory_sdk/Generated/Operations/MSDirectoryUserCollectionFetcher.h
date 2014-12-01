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
#import "MSDirectoryUser.h"
#import "MSDirectoryUserFetcher.h"

/**
* The header for type MSDirectoryUserCollectionFetcher.
*/

@protocol MSDirectoryUserCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSDirectoryUser> *users, MSODataException *error))callback;

-(id<MSDirectoryUserCollectionFetcher>)select : (NSString*) params;
-(id<MSDirectoryUserCollectionFetcher>)filter : (NSString*) params;
-(id<MSDirectoryUserCollectionFetcher>)top : (int) value;
-(id<MSDirectoryUserCollectionFetcher>)skip : (int) value;
-(id<MSDirectoryUserCollectionFetcher>)expand : (NSString*) value;
-(id<MSDirectoryUserCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSDirectoryUserCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectoryUserCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
@end

@interface MSDirectoryUserCollectionFetcher : MSODataCollectionFetcher<MSDirectoryUserCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSDirectoryUserFetcher*)getById:(NSString *)Id;
-(NSURLSessionDataTask*)addUser:(MSDirectoryUser* )entity withCallback:(void (^)(MSDirectoryUser *user, MSODataException *e))callback;

@end