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
-(MSOutlookUserFetcher*) getMe{
	return [[MSOutlookUserFetcher alloc] initWith:@"Me" :self : [MSOutlookUser class]];
}
-(MSOutlookUserCollectionFetcher*) getUsers{
	return [[MSOutlookUserCollectionFetcher alloc] initWith:@"Users" :self];
}

@end
