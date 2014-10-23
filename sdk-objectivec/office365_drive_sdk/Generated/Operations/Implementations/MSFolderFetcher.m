/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFolderFetcher.h"
#import "MSItemCollectionFetcher.h"


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

-(MSItemCollectionFetcher*) getchildren{
    return [[MSItemCollectionFetcher alloc] initWith:@"children" :self : [MSItem class]];
}


@end