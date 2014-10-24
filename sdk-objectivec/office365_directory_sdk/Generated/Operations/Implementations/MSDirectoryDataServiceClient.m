/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryDataServiceClient.h"

/**
* The implementation file for type MSDirectoryDataServiceClient.
*/

@implementation MSDirectoryDataServiceClient

-(id)initWitUrl:(NSString *)url dependencyResolver:(id<MSDependencyResolver>)resolver{
    return [super initWitUrl:url dependencyResolver:resolver];
}
-(MSDirectoryObjectCollectionFetcher*) getdirectoryObjects{
	return [[MSDirectoryObjectCollectionFetcher alloc] initWith:@"directoryObjects" :self];
}
-(MSOAuth2PermissionGrantCollectionFetcher*) getoauth2PermissionGrants{
	return [[MSOAuth2PermissionGrantCollectionFetcher alloc] initWith:@"oauth2PermissionGrants" :self];
}
-(MSSubscribedSkuCollectionFetcher*) getsubscribedSkus{
	return [[MSSubscribedSkuCollectionFetcher alloc] initWith:@"subscribedSkus" :self];
}
-(MSDirectoryObjectCollectionFetcher*) getdeletedDirectoryObjects{
	return [[MSDirectoryObjectCollectionFetcher alloc] initWith:@"deletedDirectoryObjects" :self];
}

@end
