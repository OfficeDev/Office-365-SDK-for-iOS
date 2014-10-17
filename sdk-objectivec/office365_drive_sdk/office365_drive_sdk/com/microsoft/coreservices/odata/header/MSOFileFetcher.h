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

@interface MSOFileFetcher : MSOODataEntityFetcher

-(MSOFileOperations*) getOperations;
-(NSURLSessionDataTask *)execute:(void (^)(MSOFile* file, NSError *error))callback;

@end