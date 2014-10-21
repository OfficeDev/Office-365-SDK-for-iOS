/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import "MSOODataEntityFetcher.h"
#import "MSOFileOperations.h"
#import "MSOFile.h"



/**
* The header for type MSOFileFetcher.
*/


@protocol MSOFileFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOFile* file, NSError *error))callback;

@end

@interface MSOFileFetcher : MSOODataEntityFetcher<MSOFileFetcher>

-(MSOFileOperations*) getOperations;

@end