/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "ODataEntityFetcher.h"
#import "ContactsCollectionFetcher.h"
#import "ChildFoldersCollectionFetcher.h"

@interface ContactFolderFetcher : ODataEntityFetcher

-(ContactFolderOperations*) getOperations;

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent;
-(ContactCollectionFetcher*) getContacts;
-(ContactFolderCollectionFetcher*) getChildFolders;
@end