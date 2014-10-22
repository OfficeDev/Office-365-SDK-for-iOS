/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataMediaEntityFetcher.h"
#import "MSOFileOperations.h"
#import "MSOFile.h"

/**
* The header for type MSOFileFetcher.
*/


@protocol MSOFileFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSOFile* file, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSOFile*, NSError * error))callback;
@end

@interface MSOFileFetcher : MSOODataMediaEntityFetcher<MSOFileFetcher>

-(MSOFileOperations*) getOperations;

@end