/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDeviceFetcher.h"
#import "MSDirectoryObjectCollectionFetcher.h"
#import "MSDirectoryObjectCollectionFetcher.h"


/**
* The implementation file for type MSDeviceFetcher.
*/


@implementation MSDeviceFetcher
-(MSDeviceOperations*) getOperations{
	return [[MSDeviceOperations alloc] initOperationWithUrl:self.UrlComponent Parent:self.Parent];
}

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWith:urlComponent :parent : [MSDevice class]];
}

-(MSDirectoryObjectCollectionFetcher*) getregisteredOwners{
    return [[MSDirectoryObjectCollectionFetcher alloc] initWith:@"registeredOwners" :self : [MSDirectoryObject class]];
}

-(MSDirectoryObjectCollectionFetcher*) getregisteredUsers{
    return [[MSDirectoryObjectCollectionFetcher alloc] initWith:@"registeredUsers" :self : [MSDirectoryObject class]];
}


@end