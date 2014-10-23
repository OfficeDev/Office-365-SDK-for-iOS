/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFolderFetcher.h"
#import "MSFolderCollectionFetcher.h"
#import "MSMessageCollectionFetcher.h"


/**
* The implementation file for type MSFolderFetcher.
*/


@implementation MSFolderFetcher
-(MSFolderOperations*) getOperations{
	return [[MSFolderOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSFolder class]];
}

-(MSFolderCollectionFetcher*) getChildFolders{
    return [[MSFolderCollectionFetcher alloc] initWith:@"ChildFolders" :self : [MSFolder class]];
}

-(MSMessageCollectionFetcher*) getMessages{
    return [[MSMessageCollectionFetcher alloc] initWith:@"Messages" :self : [MSMessage class]];
}


@end