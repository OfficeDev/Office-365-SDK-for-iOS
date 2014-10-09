/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "EntityContainerClient.h"
#import "User.h"
#import "UserCollectionOperations.h"

@implementation EntityContainerClient

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSODependencyResolver>) resolver{
    return [super initWitUrl:url dependencyResolver:resolver];
}
	
-(UserFetcher*) getMe{
    UserFetcher* fetcher = [[UserFetcher alloc] initWith:@"Me" :self :[User class] :[UserOperations class]];
	return fetcher;
}

@end