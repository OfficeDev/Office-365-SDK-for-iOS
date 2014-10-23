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

@protocol MSOCurrentUserRequestContextFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOCurrentUserRequestContext* currentUserRequestContext, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOCurrentUserRequestContext*, NSError * error))callback;
@end

@interface MSOCurrentUserRequestContextFetcher : MSOODataEntityFetcher<MSOCurrentUserRequestContextFetcher>

-(MSOCurrentUserRequestContextOperations*) getOperations;
-(MSODriveFetcher*) getdrive;
-(MSOItemCollectionFetcher*) getfiles;
	
@end