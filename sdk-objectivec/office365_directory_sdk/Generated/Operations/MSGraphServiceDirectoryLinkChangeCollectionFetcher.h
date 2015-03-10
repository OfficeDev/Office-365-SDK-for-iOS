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

@class MSGraphServiceDirectoryLinkChangeFetcher;

#import <office365_odata_base/office365_odata_base.h>
#import "MSGraphServiceModels.h"

/**
* The header for type MSGraphServiceDirectoryLinkChangeCollectionFetcher.
*/

@protocol MSGraphServiceDirectoryLinkChangeCollectionFetcher<MSODataCollectionFetcher>

@optional
-(NSURLSessionTask*)read:(void (^)(NSArray<MSGraphServiceDirectoryLinkChange> *directoryLinkChanges, MSODataException *error))callback;

-(id<MSGraphServiceDirectoryLinkChangeCollectionFetcher>)select : (NSString*) params;
-(id<MSGraphServiceDirectoryLinkChangeCollectionFetcher>)filter : (NSString*) params;
-(id<MSGraphServiceDirectoryLinkChangeCollectionFetcher>)top : (int) value;
-(id<MSGraphServiceDirectoryLinkChangeCollectionFetcher>)skip : (int) value;
-(id<MSGraphServiceDirectoryLinkChangeCollectionFetcher>)expand : (NSString*) value;
-(id<MSGraphServiceDirectoryLinkChangeCollectionFetcher>)orderBy : (NSString*) params;
-(id<MSGraphServiceDirectoryLinkChangeCollectionFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSGraphServiceDirectoryLinkChangeCollectionFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@required

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataExecutable>)parent;
-(MSGraphServiceDirectoryLinkChangeFetcher*)getById:(NSString *)Id;
-(NSURLSessionTask*)addDirectoryLinkChange:(MSGraphServiceDirectoryLinkChange* )entity withCallback:(void (^)(MSGraphServiceDirectoryLinkChange *directoryLinkChange, MSODataException *e))callback;

@end

@interface MSGraphServiceDirectoryLinkChangeCollectionFetcher : MSODataCollectionFetcher<MSGraphServiceDirectoryLinkChangeCollectionFetcher>

@end