/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookFolder.h"
#import "MSOutlookEntityOperations.h"
#import "MSOutlookFolder.h"
#import "MSOutlookMessage.h"

/**
* The header for type MSOutlookFolderOperations.
*/


@interface MSOutlookFolderOperations : MSOutlookEntityOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;
-(NSURLSessionDataTask*)copy : (NSString *) destinationId : (void (^)(MSOutlookFolder *folder, NSError *error))callback;			
-(NSURLSessionDataTask*)move : (NSString *) destinationId : (void (^)(MSOutlookFolder *folder, NSError *error))callback;			

@end