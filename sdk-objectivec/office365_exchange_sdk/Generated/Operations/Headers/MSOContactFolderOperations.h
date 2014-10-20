/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOContactFolder.h"
#import "MSOODataOperations.h"
#import "MSOContact.h"
#import "MSOContactFolder.h"


/**
* The header for type MSOContactFolderOperations.
*/

@interface MSOContactFolderOperations : MSOODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

@end