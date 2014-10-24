/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSApplication.h"
#import "MSDirectoryObjectOperations.h"
#import "MSAppRole.h"
#import "MSKeyCredential.h"
#import "MSOAuth2Permission.h"
#import "MSPasswordCredential.h"
#import "MSRequiredResourceAccess.h"
#import "MSExtensionProperty.h"

/**
* The header for type MSApplicationOperations.
*/


@interface MSApplicationOperations : MSDirectoryObjectOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;
-(NSURLSessionDataTask*)restore : (NSMutableArray *) identifierUris : (void (^)(MSApplication *application, NSError *error))callback;			

@end