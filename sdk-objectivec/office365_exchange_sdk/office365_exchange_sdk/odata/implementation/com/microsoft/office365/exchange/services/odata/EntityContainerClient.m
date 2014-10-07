/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "EntityContainerClient.h"
#import "User.h"
#import "UserCollectionOperations.h"

@implementation EntityContainerClient

-(id)initWit : (NSString *)url : (DependencyResolver*) resolver{
    return [super initWith:url :resolver];
}

	
-(UserFetcher*) getMe{
	return [[UserFetcher alloc] initWith:@"Me" :self :[User class] :[UserOperations class]];
}

@end
