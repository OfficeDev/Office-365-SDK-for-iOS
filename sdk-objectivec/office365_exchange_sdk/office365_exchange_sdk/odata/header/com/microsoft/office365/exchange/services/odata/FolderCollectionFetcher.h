/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "ODataCollectionFetcher.h"
#import "Folder.h"

@interface FolderCollectionFetcher : ODataCollectionFetcher

-(id)initWith:(NSString *)urlComponent :(id<ODataExecutable>)parent;
-(NSURLSessionDataTask *)execute:(void (^)(NSArray<Folder> *folders, NSError *error))callback;
@end