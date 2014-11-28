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

#import "MSSharePointClient.h"
/**
* The implementation file for type MSSharePointClient.
*/

@implementation MSSharePointClient

-(id)initWithUrl:(NSString *)url dependencyResolver:(id<MSODataDependencyResolver>)resolver{
    return [super initWithUrl:url dependencyResolver:resolver];
}

-(MSSharePointDriveFetcher*) getdrive{
	return [[MSSharePointDriveFetcher alloc] initWithUrl:@"drive" parent:self andEntityClass: [MSSharePointDrive class]];
}

-(MSSharePointItemCollectionFetcher*) getfiles{
	return [[MSSharePointItemCollectionFetcher alloc] initWithUrl:@"files" parent:self];
}

@end