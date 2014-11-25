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

#import "MSOSharePointSharePointClient.h"
/**
* The implementation file for type MSOSharePointSharePointClient.
*/

@implementation MSOSharePointSharePointClient

-(id)initWithUrl:(NSString *)url dependencyResolver:(id<MSODataDependencyResolver>)resolver{
    return [super initWithUrl:url dependencyResolver:resolver];
}

-(MSOSharePointDriveFetcher*) getdrive{
	return [[MSOSharePointDriveFetcher alloc] initWithUrl:@"drive" parent:self andEntityClass: [MSOSharePointDrive class]];
}

-(MSOSharePointItemCollectionFetcher*) getfiles{
	return [[MSOSharePointItemCollectionFetcher alloc] initWithUrl:@"files" parent:self];
}

@end