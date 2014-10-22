/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOFolder.h"
#import "MSOEntityOperations.h"
#import "MSOFolder.h"
#import "MSOMessage.h"

/**
* The header for type MSOFolderOperations.
*/


@interface MSOFolderOperations : MSOEntityOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;
-(NSURLSessionDataTask*)copy : (NSString *) destinationId : (void (^)(MSOFolder *folder, NSError *error))callback;			
-(NSURLSessionDataTask*)move : (NSString *) destinationId : (void (^)(MSOFolder *folder, NSError *error))callback;			

@end