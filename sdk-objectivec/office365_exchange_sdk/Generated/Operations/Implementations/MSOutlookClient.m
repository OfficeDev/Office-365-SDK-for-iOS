/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookClient.h"

/**
* The implementation file for type MSOutlookClient.
*/

@implementation MSOutlookClient

-(id)initWitUrl:(NSString *)url dependencyResolver:(id<MSDependencyResolver>)resolver{
    return [super initWitUrl:url dependencyResolver:resolver];
}
-(MSUserFetcher*) getMe{
	return [[MSUserFetcher alloc] initWith:@"Me" :self : [MSUser class]];
}
-(MSUserCollectionFetcher*) getUsers{
	return [[MSUserCollectionFetcher alloc] initWith:@"Users" :self];
}

@end
