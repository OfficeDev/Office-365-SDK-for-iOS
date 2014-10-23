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
-(MSOServiceInfoCollectionFetcher*) getAllServices{
	return [[MSOServiceInfoCollectionFetcher alloc] initWith:@"AllServices" :self];
}
-(MSOServiceInfoCollectionFetcher*) getServices{
	return [[MSOServiceInfoCollectionFetcher alloc] initWith:@"Services" :self];
}

@end
