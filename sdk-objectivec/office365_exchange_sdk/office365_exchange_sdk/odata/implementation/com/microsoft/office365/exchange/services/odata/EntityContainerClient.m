/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "EntityContainerClient.h"

@implementation EntityContainerClientClient

-(id)initWit : (NSString *)url : (DependencyResolver*) resolver{
    return [super initWith:url :resolver];
}

	
-(UserFetcher) getMe{
	[[UserFetcher alloc] initWith:@"Me" :self :[User class] :[UserOperations class]];
}

-(UserCollectionFetcher*) getUsers{
    return [[UserCollectionFetcher alloc] initWith:@"Users" :self :[User class] : [UserCollectionOperations class]];
}
@end
