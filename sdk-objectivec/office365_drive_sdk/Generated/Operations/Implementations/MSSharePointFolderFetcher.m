/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointFolderFetcher.h"
#import "MSSharePointItemCollectionFetcher.h"


/**
* The implementation file for type MSSharePointFolderFetcher.
*/


@implementation MSSharePointFolderFetcher
-(MSSharePointFolderOperations*) getOperations{
	return [[MSSharePointFolderOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSSharePointFolder class]];
}

-(MSSharePointItemCollectionFetcher*) getchildren{
    return [[MSSharePointItemCollectionFetcher alloc] initWith:@"children" :self : [MSSharePointItem class]];
}


@end