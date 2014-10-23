/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODataEntityFetcher.h"
#import "MSFileOperations.h"
#import "MSFile.h"
#import "MSODataMediaEntityFetcher.h"
/**
* The header for type MSFileFetcher.
*/

@protocol MSFileFetcher

@optional
-(NSURLSessionDataTask *)execute:(void (^)(MSFile* file, NSError *error))callback;
-(NSURLSessionDataTask*) update:(id)updatedEntity :(void (^)(MSFile*, NSError * error))callback;
@end

@interface MSFileFetcher : MSODataMediaEntityFetcher<MSFileFetcher>

-(MSFileOperations*) getOperations;
	
@end