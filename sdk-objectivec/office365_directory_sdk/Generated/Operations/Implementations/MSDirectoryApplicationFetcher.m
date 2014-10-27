/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryApplicationFetcher.h"
#import "MSDirectoryExtensionPropertyCollectionFetcher.h"


/**
* The implementation file for type MSDirectoryApplicationFetcher.
*/


@implementation MSDirectoryApplicationFetcher
-(MSDirectoryApplicationOperations*) getOperations{
	return [[MSDirectoryApplicationOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSDirectoryApplication class]];
}

-(MSDirectoryExtensionPropertyCollectionFetcher*) getextensionProperties{
    return [[MSDirectoryExtensionPropertyCollectionFetcher alloc] initWith:@"extensionProperties" :self : [MSDirectoryExtensionProperty class]];
}


@end