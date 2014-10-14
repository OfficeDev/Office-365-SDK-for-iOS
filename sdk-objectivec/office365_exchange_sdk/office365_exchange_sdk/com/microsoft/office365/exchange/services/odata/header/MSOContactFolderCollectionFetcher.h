/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataCollectionFetcher.h"
#import "MSOContactFolder.h"
#import "MSOContactFolderFetcher.h"

@interface MSOContactFolderCollectionFetcher : MSOODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*)execute:(void (^)(NSArray<MSOContactFolder> *ContactFolder, NSError *error))callback;

-(NSURLSessionDataTask*)add:(MSOContactFolder* )entity :(void (^)(MSOContactFolder *contactFolder, NSError *e))callback;

-(MSOContactFolderFetcher*)getById:(NSString *)Id;
@end
