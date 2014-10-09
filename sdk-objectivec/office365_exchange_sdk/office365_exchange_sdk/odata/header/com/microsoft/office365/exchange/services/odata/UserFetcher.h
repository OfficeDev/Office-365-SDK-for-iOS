/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "ODataEntityFetcher.h"
#import "UserOperations.h"
#import "FolderCollectionFetcher.h"
#import "MessageCollectionFetcher.h"
#import "FolderFetcher.h"
#import "User.h"

@interface UserFetcher : ODataEntityFetcher

-(UserOperations*) getOperations;
-(FolderCollectionFetcher*) getFolders;
-(MessageCollectionFetcher*) getMessages;
-(FolderFetcher*) getRootFolder;
-(NSURLSessionDataTask *)execute:(void (^)(User* user, NSError *error))callback;
@end