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
-(NSURLSessionDataTask *)read:(void (^)(MSDirectorySubscribedSku* subscribedSku, MSODataException *error))callback;
-(NSURLSessionDataTask*) updateSubscribedSku:(id)entity withCallback:(void (^)(MSDirectorySubscribedSku*, MSODataException * error))callback;
-(NSURLSessionDataTask*) deleteSubscribedSku:(void (^)(int status, MSODataException * error))callback;
-(id<MSDirectorySubscribedSkuFetcher>)addCustomParameters : (NSString*)name : (id)value;
-(id<MSDirectorySubscribedSkuFetcher>)addCustomHeaderWithName : (NSString*)name andValue : (NSString*) value;

@end

@interface MSDirectorySubscribedSkuFetcher : MSODataEntityFetcher<MSDirectorySubscribedSkuFetcher>

-(MSDirectorySubscribedSkuOperations*) getOperations;

	
@end