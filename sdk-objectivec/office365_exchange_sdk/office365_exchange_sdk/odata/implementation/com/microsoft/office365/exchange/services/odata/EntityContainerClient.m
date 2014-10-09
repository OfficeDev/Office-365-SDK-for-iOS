/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "EntityContainerClient.h"

@implementation EntityContainerClient

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSODependencyResolver>) resolver{
    return [super initWitUrl:url dependencyResolver:resolver];
}
	
-(UserFetcher*) getMe{
    return [[UserFetcher alloc] initWith:@"Me" :self];
}

@end