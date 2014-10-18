/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataEntityFetcher.h"
#import "MSOCurrentUserRequestContextOperations.h"
#import "MSOCurrentUserRequestContext.h"

@class MSODriveFetcher;
@class MSOItemCollectionFetcher;


/**
* The header for type MSOCurrentUserRequestContextFetcher.
*/

@interface MSOCurrentUserRequestContextFetcher : MSOODataEntityFetcher

-(MSOCurrentUserRequestContextOperations*) getOperations;
-(NSURLSessionDataTask *)execute:(void (^)(MSOCurrentUserRequestContext* currentUserRequestContext, NSError *error))callback;

-(MSODriveFetcher*) getdrive;
-(MSOItemCollectionFetcher*) getfiles;
@end