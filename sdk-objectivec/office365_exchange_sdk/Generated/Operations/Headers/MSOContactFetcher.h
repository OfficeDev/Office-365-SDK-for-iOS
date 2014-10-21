/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import "MSOODataEntityFetcher.h"
#import "MSOContactOperations.h"
#import "MSOContact.h"



/**
* The header for type MSOContactFetcher.
*/


@protocol MSOContactFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOContact* contact, NSError *error))callback;

@end

@interface MSOContactFetcher : MSOODataEntityFetcher<MSOContactFetcher>

-(MSOContactOperations*) getOperations;

@end