/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointFolder.h"
#import "MSSharePointItemOperations.h"
#import "MSSharePointItem.h"

/**
* The header for type MSSharePointFolderOperations.
*/


@interface MSSharePointFolderOperations : MSSharePointItemOperations

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataExecutable>)parent;
-(NSURLSessionDataTask*)copy : (NSString *) destFolderId : (NSString *) destFolderPath : (NSString *) newName : (void (^)(MSSharePointFolder *folder, NSError *error))callback;			

@end