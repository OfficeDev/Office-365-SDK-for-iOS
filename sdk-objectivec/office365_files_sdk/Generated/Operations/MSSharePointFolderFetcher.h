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

@class MSSharePointItemFetcher;;
@class MSSharePointItemCollectionFetcher;;
@class MSSharePointFolderOperations;

#import <office365_odata_base/office365_odata_base.h>
#import "MSSharePointModels.h"

/**
* The header for type MSSharePointFolderFetcher.
*/


@protocol MSSharePointFolderFetcher<MSODataEntityFetcher>

@optional
-(NSURLSessionTask*) read:(void (^)(MSSharePointFolder* folder, MSODataException *error))callback;
-(NSURLSessionTask*) updateFolder:(id)entity withCallback:(void (^)(MSSharePointFolder*, MSODataException * error))callback;
-(NSURLSessionTask*) deleteFolder:(void (^)(int status, MSODataException * error))callback;
-(id<MSSharePointFolderFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSSharePointFolderFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;
-(id<MSSharePointFolderFetcher>)select : (NSString*) params;
-(id<MSSharePointFolderFetcher>)expand : (NSString*) value;

@required
-(MSSharePointFolderOperations*) getOperations;
-(MSSharePointItemCollectionFetcher*) getchildren;

-(MSSharePointItemFetcher*) getchildrenById : (NSString*)_id;
@end

@interface MSSharePointFolderFetcher : MSODataEntityFetcher<MSSharePointFolderFetcher>

@end