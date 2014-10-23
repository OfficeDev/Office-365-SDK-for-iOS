/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFolder.h"
#import "MSItemOperations.h"
#import "MSItem.h"

/**
* The header for type MSFolderOperations.
*/


@interface MSFolderOperations : MSItemOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;
-(NSURLSessionDataTask*)copy : (NSString *) destFolderId : (NSString *) destFolderPath : (NSString *) newName : (void (^)(MSFolder *folder, NSError *error))callback;			

@end