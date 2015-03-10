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

@implementation MSGraphServiceItemFetcher

-(MSGraphServiceItemOperations*) getOperations{
	return [[MSGraphServiceItemOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataExecutable>)parent{
    self.Parent = parent;
    self.UrlComponent = urlComponent;

    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSGraphServiceItem class]];
}

-(NSURLSessionTask*) updateItem:(id)entity withCallback:(void (^)(MSGraphServiceItem*, MSODataException * error))callback{
	return [super update:entity : callback];
}

-(NSURLSessionTask*) deleteItem:(void (^)(int status, MSODataException * error))callback{
	return [super delete:callback];
}

-(MSGraphServiceUserFetcher*) getcreatedByUser{
	 return [[MSGraphServiceUserFetcher alloc] initWithUrl:@"createdByUser" parent:self andEntityClass: [MSGraphServiceUser class]];
}
-(MSGraphServiceUserFetcher*) getlastModifiedByUser{
	 return [[MSGraphServiceUserFetcher alloc] initWithUrl:@"lastModifiedByUser" parent:self andEntityClass: [MSGraphServiceUser class]];
}
-(MSGraphServiceFileFetcher*) asFile{
	return [[MSGraphServiceFileFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSGraphServiceFile class]];
}
-(MSGraphServiceFolderFetcher*) asFolder{
	return [[MSGraphServiceFolderFetcher alloc] initWithUrl :self.UrlComponent parent:self.Parent andEntityClass:[MSGraphServiceFolder class]];
}

@end