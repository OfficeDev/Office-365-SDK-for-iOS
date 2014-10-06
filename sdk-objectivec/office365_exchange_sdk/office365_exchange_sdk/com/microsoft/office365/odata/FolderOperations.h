/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@implementation FolderOperations

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;

-(NSURLSessionDataTask*)copy : (NSString *) DestinationId : :(void (^)(Folder d, NSError *error))callback;			

-(NSURLSessionDataTask*)move : (NSString *) DestinationId : :(void (^)(Folder d, NSError *error))callback;			
@end