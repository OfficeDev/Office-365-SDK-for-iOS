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

-(id)initWith:(NSString *)urlComponent :(ODataExecutable *)parent{
    
    return [super initWith:urlComponent :parent :[ContactFolder class] :[ContactFolderOperations class]];
}
-(ContactCollectionFetcher*) getContacts{
    return [[ContactCollectionFetcher alloc] initWith:@"Contacts" :self :[Contact class] : [ContactCollectionOperations class]];
}
-(ContactFolderCollectionFetcher*) getChildFolders{
    return [[ContactFolderCollectionFetcher alloc] initWith:@"ChildFolders" :self :[ContactFolder class] : [ContactFolderCollectionOperations class]];
}
@end