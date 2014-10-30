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

-(id)initWitUrl:(NSString *)url dependencyResolver:(id<MSDependencyResolver>)resolver{
    return [super initWitUrl:url dependencyResolver:resolver];
}
-(MSSharePointDriveFetcher*) getdrive{
	return [[MSSharePointDriveFetcher alloc] initWith:@"drive" :self : [MSSharePointDrive class]];
}
-(MSSharePointItemCollectionFetcher*) getfiles{
	return [[MSSharePointItemCollectionFetcher alloc] initWith:@"files" :self];
}

@end
