/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFolder.h"
#import "MSEntityOperations.h"
#import "MSFolder.h"
#import "MSMessage.h"

/**
* The header for type MSFolderOperations.
*/


@interface MSFolderOperations : MSEntityOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;
-(NSURLSessionDataTask*)copy : (NSString *) destinationId : (void (^)(MSFolder *folder, NSError *error))callback;			
-(NSURLSessionDataTask*)move : (NSString *) destinationId : (void (^)(MSFolder *folder, NSError *error))callback;			

@end