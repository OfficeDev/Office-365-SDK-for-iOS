/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOEntityContainerClient.h"

/**
* The implementation file for type MSOEntityContainerClient.
*/

@implementation MSOEntityContainerClient

-(id)initWitUrl:(NSString *)url dependencyResolver:(id<MSODependencyResolver>)resolver{
    return [super initWitUrl:url dependencyResolver:resolver];
}
-(MSODriveFetcher*) getdrive{
	return [[MSODriveFetcher alloc] initWith:@"drive" :self : [MSODrive class]];
}
-(MSOCurrentUserRequestContextFetcher*) getme{
	return [[MSOCurrentUserRequestContextFetcher alloc] initWith:@"me" :self : [MSOCurrentUserRequestContext class]];
}
-(MSOItemCollectionFetcher*) getfiles{
	return [[MSOItemCollectionFetcher alloc] initWith:@"files" :self];
}

@end
