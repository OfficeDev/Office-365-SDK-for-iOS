/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOContactFolderFetcher.h"
#import "MSOContactCollectionFetcher.h"
#import "MSOContactFolderCollectionFetcher.h"


/**
* The implementation file for type MSOContactFolderFetcher.
*/

@implementation MSOContactFolderFetcher

-(MSOContactFolderOperations*) getOperations{
	return [[MSOContactFolderOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSOContactFolder class]];
}

-(MSOContactCollectionFetcher*) getContacts{
    return [[MSOContactCollectionFetcher alloc] initWith:@"Contacts" :self : [MSOContact class]];
}

-(MSOContactFolderCollectionFetcher*) getChildFolders{
    return [[MSOContactFolderCollectionFetcher alloc] initWith:@"ChildFolders" :self : [MSOContactFolder class]];
}

@end