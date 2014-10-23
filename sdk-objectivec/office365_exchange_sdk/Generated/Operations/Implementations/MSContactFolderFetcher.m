/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSContactFolderFetcher.h"
#import "MSContactCollectionFetcher.h"
#import "MSContactFolderCollectionFetcher.h"


/**
* The implementation file for type MSContactFolderFetcher.
*/


@implementation MSContactFolderFetcher
-(MSContactFolderOperations*) getOperations{
	return [[MSContactFolderOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSContactFolder class]];
}

-(MSContactCollectionFetcher*) getContacts{
    return [[MSContactCollectionFetcher alloc] initWith:@"Contacts" :self : [MSContact class]];
}

-(MSContactFolderCollectionFetcher*) getChildFolders{
    return [[MSContactFolderCollectionFetcher alloc] initWith:@"ChildFolders" :self : [MSContactFolder class]];
}


@end