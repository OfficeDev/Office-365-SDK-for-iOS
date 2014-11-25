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

#import "MSOOutlookOutlookClient.h"

/**
* The implementation file for type MSOOutlookOutlookClient.
*/

@implementation MSOOutlookOutlookClient

-(id)initWithUrl:(NSString *)url dependencyResolver:(id<MSODataDependencyResolver>)resolver{
    return [super initWithUrl:url dependencyResolver:resolver];
}

-(MSOOutlookUserFetcher*) getMe{
	return [[MSOOutlookUserFetcher alloc] initWithUrl:@"Me" parent:self andEntityClass: [MSOOutlookUser class]];
}

-(MSOOutlookUserCollectionFetcher*) getUsers{
	return [[MSOOutlookUserCollectionFetcher alloc] initWithUrl:@"Users" parent:self];
}

@end