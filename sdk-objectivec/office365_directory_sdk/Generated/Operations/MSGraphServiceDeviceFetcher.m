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

#import "MSGraphServiceODataEntities.h"

@implementation MSGraphServiceDeviceFetcher

-(MSGraphServiceDeviceOperations*) getOperations{
	return [[MSGraphServiceDeviceOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataExecutable>)parent{
    self.Parent = parent;
    self.UrlComponent = urlComponent;

    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSGraphServiceDevice class]];
}

-(NSURLSessionTask*) updateDevice:(id)entity withCallback:(void (^)(MSGraphServiceDevice*, MSODataException * error))callback{
	return [super update:entity : callback];
}

-(NSURLSessionTask*) deleteDevice:(void (^)(int status, MSODataException * error))callback{
	return [super delete:callback];
}

-(MSGraphServiceDirectoryObjectCollectionFetcher*) getregisteredOwners{
    return [[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"registeredOwners" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]];
}

-(id<MSGraphServiceDirectoryObjectFetcher>) getregisteredOwnersById : (NSString*)_id{
    return [[[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"registeredOwners" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]] getById:_id];
}
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getregisteredUsers{
    return [[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"registeredUsers" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]];
}

-(id<MSGraphServiceDirectoryObjectFetcher>) getregisteredUsersById : (NSString*)_id{
    return [[[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"registeredUsers" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]] getById:_id];
}

@end