/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "ContactFolderFetcher.h"

@implementation ContactFolderFetcher

-(ContactFolderOperations*) getOperations{
    return (ContactFolderOperations*)[super getOperations];
}

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;
-(ContactCollectionFetcher*) getContacts;
-(ContactFolderCollectionFetcher*) getChildFolders;
@end