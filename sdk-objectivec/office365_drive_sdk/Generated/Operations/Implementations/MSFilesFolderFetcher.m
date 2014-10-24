/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesFolderFetcher.h"
#import "MSFilesItemCollectionFetcher.h"


/**
* The implementation file for type MSFilesFolderFetcher.
*/


@implementation MSFilesFolderFetcher
-(MSFilesFolderOperations*) getOperations{
	return [[MSFilesFolderOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSFilesODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSFilesFolder class]];
}

-(MSFilesItemCollectionFetcher*) getchildren{
    return [[MSFilesItemCollectionFetcher alloc] initWith:@"children" :self : [MSFilesItem class]];
}


@end