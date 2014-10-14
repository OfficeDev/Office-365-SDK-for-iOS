/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataEntityFetcher.h"
#import "MSOEntityOperations.h"
#import "MSOEntity.h"


@interface MSOEntityFetcher : MSOODataEntityFetcher

-(MSOEntityOperations*) getOperations;
-(NSURLSessionDataTask *)execute:(void (^)(MSOEntity* entity, NSError *error))callback;

@end