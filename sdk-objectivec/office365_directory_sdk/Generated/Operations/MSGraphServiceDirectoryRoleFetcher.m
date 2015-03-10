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

@implementation MSGraphServiceDirectoryRoleFetcher

-(MSGraphServiceDirectoryRoleOperations*) getOperations{
	return [[MSGraphServiceDirectoryRoleOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataExecutable>)parent{
    self.Parent = parent;
    self.UrlComponent = urlComponent;

    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSGraphServiceDirectoryRole class]];
}

-(NSURLSessionTask*) updateDirectoryRole:(id)entity withCallback:(void (^)(MSGraphServiceDirectoryRole*, MSODataException * error))callback{
	return [super update:entity : callback];
}

-(NSURLSessionTask*) deleteDirectoryRole:(void (^)(int status, MSODataException * error))callback{
	return [super delete:callback];
}

-(MSGraphServiceDirectoryObjectCollectionFetcher*) getmembers{
    return [[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"members" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]];
}

-(id<MSGraphServiceDirectoryObjectFetcher>) getmembersById : (NSString*)_id{
    return [[[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"members" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]] getById:_id];
}
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getmemberOf{
    return [[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"memberOf" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]];
}

-(id<MSGraphServiceDirectoryObjectFetcher>) getmemberOfById : (NSString*)_id{
    return [[[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"memberOf" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]] getById:_id];
}
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getowners{
    return [[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"owners" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]];
}

-(id<MSGraphServiceDirectoryObjectFetcher>) getownersById : (NSString*)_id{
    return [[[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"owners" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]] getById:_id];
}
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getownedObjects{
    return [[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"ownedObjects" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]];
}

-(id<MSGraphServiceDirectoryObjectFetcher>) getownedObjectsById : (NSString*)_id{
    return [[[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"ownedObjects" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]] getById:_id];
}

@end