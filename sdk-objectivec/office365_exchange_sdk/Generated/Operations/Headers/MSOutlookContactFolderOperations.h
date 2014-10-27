/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookContactFolder.h"
#import "MSOutlookEntityOperations.h"
#import "MSOutlookContact.h"
#import "MSOutlookContactFolder.h"

/**
* The header for type MSOutlookContactFolderOperations.
*/


@interface MSOutlookContactFolderOperations : MSOutlookEntityOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOutlookODataExecutable>)parent;

@end