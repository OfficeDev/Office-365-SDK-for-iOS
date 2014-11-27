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
#import "MSDirectorySubscribedSkuOperations.h"
#import "MSDirectorySubscribedSku.h"


/**
* The header for type MSDirectorySubscribedSkuFetcher.
*/

@protocol MSDirectorySubscribedSkuFetcher

@optional
-(NSURLSessionDataTask *)read:(void (^)(MSDirectorySubscribedSku* subscribedSku, NSError *error))callback;
-(NSURLSessionDataTask*) updateSubscribedSku:(id)entity withCallback:(void (^)(MSDirectorySubscribedSku*, NSError * error))callback;
-(NSURLSessionDataTask*) deleteSubscribedSku:(void (^)(int status, NSError * error))callback;

@end

@interface MSDirectorySubscribedSkuFetcher : MSODataEntityFetcher<MSDirectorySubscribedSkuFetcher>

-(MSDirectorySubscribedSkuOperations*) getOperations;

	
@end