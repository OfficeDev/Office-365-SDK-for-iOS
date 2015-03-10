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

@implementation MSGraphServiceContactFetcher

-(MSGraphServiceContactOperations*) getOperations{
	return [[MSGraphServiceContactOperations alloc] initOperationWithUrl:self.UrlComponent parent:self.Parent];
}

-(id)initWithUrl:(NSString*)urlComponent :(id<MSODataExecutable>)parent{
    self.Parent = parent;
    self.UrlComponent = urlComponent;

    return [super initWithUrl:urlComponent parent:parent andEntityClass : [MSGraphServiceContact class]];
}

-(NSURLSessionTask*) updateContact:(id)entity withCallback:(void (^)(MSGraphServiceContact*, MSODataException * error))callback{
	return [super update:entity : callback];
}

-(NSURLSessionTask*) deleteContact:(void (^)(int status, MSODataException * error))callback{
	return [super delete:callback];
}

-(MSGraphServiceDirectoryObjectFetcher*) getmanager{
	 return [[MSGraphServiceDirectoryObjectFetcher alloc] initWithUrl:@"manager" parent:self andEntityClass: [MSGraphServiceDirectoryObject class]];
}
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getdirectReports{
    return [[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"directReports" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]];
}

-(id<MSGraphServiceDirectoryObjectFetcher>) getdirectReportsById : (NSString*)_id{
    return [[[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"directReports" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]] getById:_id];
}
-(MSGraphServiceDirectoryObjectCollectionFetcher*) getmemberOf{
    return [[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"memberOf" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]];
}

-(id<MSGraphServiceDirectoryObjectFetcher>) getmemberOfById : (NSString*)_id{
    return [[[MSGraphServiceDirectoryObjectCollectionFetcher alloc] initWithUrl:@"memberOf" parent:self andEntityClass:[MSGraphServiceDirectoryObject class]] getById:_id];
}

@end