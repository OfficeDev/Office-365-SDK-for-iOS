/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDiscoveryServiceInfoFetcher.h"


/**
* The implementation file for type MSDiscoveryServiceInfoFetcher.
*/


@implementation MSDiscoveryServiceInfoFetcher
-(MSDiscoveryServiceInfoOperations*) getOperations{
	return [[MSDiscoveryServiceInfoOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSDiscoveryODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSDiscoveryServiceInfo class]];
}


@end