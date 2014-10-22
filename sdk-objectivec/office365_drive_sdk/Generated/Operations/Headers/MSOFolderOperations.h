/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOFolder.h"
#import "MSOItemOperations.h"
#import "MSOItem.h"

/**
* The header for type MSOFolderOperations.
*/


@interface MSOFolderOperations : MSOItemOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*)copy : (NSString *) destFolderId : (NSString *) destFolderPath : (NSString *) newName : (void (^)(MSOFolder *folder, NSError *error))callback;			

@end