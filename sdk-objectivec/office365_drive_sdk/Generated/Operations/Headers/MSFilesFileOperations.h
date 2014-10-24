/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesFile.h"
#import "MSFilesItemOperations.h"

/**
* The header for type MSFilesFileOperations.
*/


@interface MSFilesFileOperations : MSFilesItemOperations

-(id)initWith:(NSString *)urlComponent :(id<MSFilesODataExecutable>)parent;
-(NSURLSessionDataTask*)copy : (NSString *) destFolderId : (NSString *) destFolderPath : (NSString *) newName : (void (^)(MSOFile *file, NSError *error))callback;			

@end