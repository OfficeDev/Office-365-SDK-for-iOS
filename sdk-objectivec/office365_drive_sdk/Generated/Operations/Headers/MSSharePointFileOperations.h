/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointFile.h"
#import "MSSharePointItemOperations.h"

/**
* The header for type MSSharePointFileOperations.
*/


@interface MSSharePointFileOperations : MSSharePointItemOperations

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataExecutable>)parent;
-(NSURLSessionDataTask*)copy : (NSString *) destFolderId : (NSString *) destFolderPath : (NSString *) newName : (void (^)(MSSharePointFile *file, NSError *error))callback;			

@end