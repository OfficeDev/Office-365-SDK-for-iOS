/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataCollectionFetcher.h"
#import "MSOFile.h"
#import "MSOFileFetcher.h"

/**
* The header for type MSOFileCollectionFetcher.
*/

@interface MSOFileCollectionFetcher : MSOODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOFile> *File, NSError *error))callback;

-(NSURLSessionDataTask*)add:(MSOFile* )entity :(void (^)(MSOFile *file, NSError *e))callback;

-(MSOFileFetcher*)getById:(NSString *)Id;
@end
