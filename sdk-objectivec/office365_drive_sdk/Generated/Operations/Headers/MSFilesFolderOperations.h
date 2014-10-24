/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesFolder.h"
#import "MSFilesItemOperations.h"
#import "MSFilesItem.h"

/**
* The header for type MSFilesFolderOperations.
*/


@interface MSFilesFolderOperations : MSFilesItemOperations

-(id)initWith:(NSString *)urlComponent :(id<MSFilesODataExecutable>)parent;
-(NSURLSessionDataTask*)copy : (NSString *) destFolderId : (NSString *) destFolderPath : (NSString *) newName : (void (^)(MSOFolder *folder, NSError *error))callback;			

@end