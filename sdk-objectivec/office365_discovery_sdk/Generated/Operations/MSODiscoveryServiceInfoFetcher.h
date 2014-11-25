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
#import "MSODiscoveryServiceInfoOperations.h"
#import "MSODiscoveryServiceInfo.h"

/**
* The header for type MSODiscoveryServiceInfoFetcher.
*/

@protocol MSODiscoveryServiceInfoFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSODiscoveryServiceInfo* serviceInfo, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSODiscoveryServiceInfo*, NSError * error))callback;
@end

@interface MSODiscoveryServiceInfoFetcher : MSODataEntityFetcher<MSODiscoveryServiceInfoFetcher>

-(MSODiscoveryServiceInfoOperations*) getOperations;

	
@end