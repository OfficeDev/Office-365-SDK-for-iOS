/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "ODataOperations.h"
#import "Contact.h"
#import "ContactFolder.h"

@interface ContactFolderOperations : ODataOperations

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;

@end