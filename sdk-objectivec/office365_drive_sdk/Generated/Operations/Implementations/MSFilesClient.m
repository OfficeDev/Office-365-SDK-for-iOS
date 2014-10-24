/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesClient.h"

/**
* The implementation file for type MSFilesClient.
*/

@implementation MSFilesClient

-(id)initWitUrl:(NSString *)url dependencyResolver:(id<MSFilesDependencyResolver>)resolver{
    return [super initWitUrl:url dependencyResolver:resolver];
}
-(MSODriveFetcher*) getdrive{
	return [[MSODriveFetcher alloc] initWith:@"drive" :self : [MSODrive class]];
}
-(MSOItemCollectionFetcher*) getfiles{
	return [[MSOItemCollectionFetcher alloc] initWith:@"files" :self];
}

@end
