/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "EntityContainerClient.h"

@implementation EntityContainerClientClient

-(id)initWit : (NSString *)url : (DependencyResolver*) resolver;

	
-(UserFetcher) getMe;

-(UserCollectionFetcher*) getUsers;
@end
