/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataEntityFetcher.h"
#import "MSOItemOperations.h"
#import "MSOItem.h"


@interface MSOItemFetcher : MSOODataEntityFetcher

-(MSOItemOperations*) getOperations;
-(NSURLSessionDataTask *)execute:(void (^)(MSOItem* item, NSError *error))callback;

@end