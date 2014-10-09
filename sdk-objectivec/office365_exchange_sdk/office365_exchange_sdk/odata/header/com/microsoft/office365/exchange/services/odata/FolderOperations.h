/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "ODataOperations.h"
#import "Folder.h"
#import "Message.h"

@interface FolderOperations : ODataOperations

-(NSURLSessionDataTask*)copy : (NSString *) DestinationId : (void (^)(Folder *folder, NSError *error))callback;			
-(NSURLSessionDataTask*)move : (NSString *) DestinationId : (void (^)(Folder *folder, NSError *error))callback;			

@end