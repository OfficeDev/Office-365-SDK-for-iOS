/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryApplication.h"
#import "MSDirectoryDirectoryObjectOperations.h"
#import "MSDirectoryAppRole.h"
#import "MSDirectoryKeyCredential.h"
#import "MSDirectoryOAuth2Permission.h"
#import "MSDirectoryPasswordCredential.h"
#import "MSDirectoryRequiredResourceAccess.h"
#import "MSDirectoryExtensionProperty.h"

/**
* The header for type MSDirectoryApplicationOperations.
*/


@interface MSDirectoryApplicationOperations : MSDirectoryDirectoryObjectOperations

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;
-(NSURLSessionDataTask*)restore : (NSMutableArray *) identifierUris : (void (^)(MSDirectoryApplication *application, NSError *error))callback;			

@end