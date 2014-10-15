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
-(MSOUserFetcher*) getMe{
	return [[MSOUserFetcher alloc] initWith:@"Me" :self : [MSOUser class]];
}
-(MSOUserCollectionFetcher*) getUsers{
	return [[MSOUserCollectionFetcher alloc] initWith:@"Users" :self];
}

@end
