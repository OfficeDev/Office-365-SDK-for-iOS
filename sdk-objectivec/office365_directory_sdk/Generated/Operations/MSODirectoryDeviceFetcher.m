/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * Licensed under the Apache License, Version 2.0.
 * See License.txt in the project root for license information.
 *
 * Warning: This code was generated automatically. Edits will be overwritten.
 * To make changes to this code, please make changes to the generation framework itself:
 * https://github.com/MSOpenTech/odata-codegen
 *******************************************************************************/

#import "MSODirectoryDeviceFetcher.h"
#import "MSODirectoryDirectoryObjectCollectionFetcher.h"
#import "MSODirectoryDirectoryObjectCollectionFetcher.h"


/**
* The implementation file for type MSODirectoryDeviceFetcher.
*/


@implementation MSODirectoryDeviceFetcher

-(MSODirectoryDeviceOperations*) getOperations{
	return [[MSODirectoryDeviceOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataReadable>)parent{
    
    self.Parent = parent;
    self.UrlComponent = urlComponent;
    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSODirectoryDevice class]];
}


-(MSODirectoryDirectoryObjectCollectionFetcher*) getregisteredOwners{
    return [[MSODirectoryDirectoryObjectCollectionFetcher alloc] initWithUrl:@"registeredOwners" parent:self andEntityClass:[MSODirectoryDirectoryObject class]];
}


-(MSODirectoryDirectoryObjectCollectionFetcher*) getregisteredUsers{
    return [[MSODirectoryDirectoryObjectCollectionFetcher alloc] initWithUrl:@"registeredUsers" parent:self andEntityClass:[MSODirectoryDirectoryObject class]];
}


@end