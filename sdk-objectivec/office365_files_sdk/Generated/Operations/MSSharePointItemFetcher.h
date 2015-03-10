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

@class MSSharePointFileFetcher;;
@class MSSharePointFolderFetcher;;
@class MSSharePointItemOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSSharePointModels.h"

/**
* The header for type MSSharePointItemFetcher.
*/


@protocol MSSharePointItemFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSSharePointItem* item, MSODataException *error))callback;
-(NSURLSessionTask*) updateItem:(id)entity withCallback:(void (^)(MSSharePointItem*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteItem:(void (^)(int status, MSODataException * error))callback;
-(id<MSSharePointItemFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSSharePointItemFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSSharePointItemFetcher>)select : (NSString*) params;
-(id<MSSharePointItemFetcher>)expand : (NSString*) value;

@required
-(MSSharePointItemOperations*) getOperations;
	
-(MSSharePointFileFetcher*) asFile;	
	
-(MSSharePointFolderFetcher*) asFolder;	
@end

@interface MSSharePointItemFetcher : MSODataEntityFetcher<MSSharePointItemFetcher>

@end