/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryDeviceFetcher.h"
#import "MSDirectoryDirectoryObjectCollectionFetcher.h"
#import "MSDirectoryDirectoryObjectCollectionFetcher.h"


/**
* The implementation file for type MSDirectoryDeviceFetcher.
*/


@implementation MSDirectoryDeviceFetcher
-(MSDirectoryDeviceOperations*) getOperations{
	return [[MSDirectoryDeviceOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSDirectoryDevice class]];
}

-(MSDirectoryDirectoryObjectCollectionFetcher*) getregisteredOwners{
    return [[MSDirectoryDirectoryObjectCollectionFetcher alloc] initWith:@"registeredOwners" :self : [MSDirectoryDirectoryObject class]];
}

-(MSDirectoryDirectoryObjectCollectionFetcher*) getregisteredUsers{
    return [[MSDirectoryDirectoryObjectCollectionFetcher alloc] initWith:@"registeredUsers" :self : [MSDirectoryDirectoryObject class]];
}


@end