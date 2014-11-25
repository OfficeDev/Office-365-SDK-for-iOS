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
#import "MSOOutlookFolder.h"
#import "MSOOutlookFolderFetcher.h"

/**
* The header for type MSOOutlookFolderCollectionFetcher.
*/

@protocol MSOOutlookFolderCollectionFetcher

@optional
-(NSURLSessionDataTask*)read:(void (^)(NSArray<MSOOutlookFolder> *folders, NSError *error))callback;

@end

@interface MSOOutlookFolderCollectionFetcher : MSODataCollectionFetcher<MSOOutlookFolderCollectionFetcher>

-(id)initWithUrl:(NSString *)urlComponent parent:(id<MSODataReadable>)parent;

-(NSURLSessionDataTask*)addEntity:(MSOOutlookFolder* )entity withCallback:(void (^)(MSOOutlookFolder *folder, NSError *e))callback;

-(MSOOutlookFolderFetcher*)getById:(NSString *)Id;

@end