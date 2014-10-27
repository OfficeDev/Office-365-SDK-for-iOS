/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectorySubscribedSkuFetcher.h"


/**
* The implementation file for type MSDirectorySubscribedSkuFetcher.
*/


@implementation MSDirectorySubscribedSkuFetcher
-(MSDirectorySubscribedSkuOperations*) getOperations{
	return [[MSDirectorySubscribedSkuOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSDirectorySubscribedSku class]];
}


@end