/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointClient.h"

/**
* The implementation file for type MSSharePointClient.
*/

@implementation MSSharePointClient

-(id)initWitUrl:(NSString *)url dependencyResolver:(id<MSDependencyResolver>)resolver{
    return [super initWitUrl:url dependencyResolver:resolver];
}
-(MSDriveFetcher*) getdrive{
	return [[MSDriveFetcher alloc] initWith:@"drive" :self : [MSDrive class]];
}
-(MSItemCollectionFetcher*) getfiles{
	return [[MSItemCollectionFetcher alloc] initWith:@"files" :self];
}

@end
