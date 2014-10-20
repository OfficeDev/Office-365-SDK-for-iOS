/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOContactFolder.h"
#import "MSOODataCollectionFetcher.h"
#import "MSOContactFolderFetcher.h"

/**
* The header for type MSOContactFolderCollectionFetcher.
*/

@interface MSOContactFolderCollectionFetcher : MSOODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

-(NSURLSessionDataTask*)add:(MSOContactFolder* )entity :(void (^)(MSOContactFolder *contactFolder, NSError *e))callback;

-(MSOContactFolderFetcher*)getById:(NSString *)Id;
@end
