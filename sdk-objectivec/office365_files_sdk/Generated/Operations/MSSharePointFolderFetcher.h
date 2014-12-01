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
#import "MSSharePointFolderOperations.h"
#import "MSSharePointFolder.h"
@class MSSharePointItemCollectionFetcher;


/**
* The header for type MSSharePointFolderFetcher.
*/

@protocol MSSharePointFolderFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSSharePointFolder* folder, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateFolder:(id)entity withCallback:(void (^)(MSSharePointFolder*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteFolder:(void (^)(int status, MSODataException * error))callback;
-(id<MSSharePointFolderFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSSharePointFolderFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@end

@interface MSSharePointFolderFetcher : MSODataEntityFetcher<MSSharePointFolderFetcher>

-(MSSharePointFolderOperations*) getOperations;

-(MSSharePointItemCollectionFetcher*) getchildren;

	
@end