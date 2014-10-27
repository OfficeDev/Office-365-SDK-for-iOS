/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointDriveFetcher.h"
#import "MSSharePointItemCollectionFetcher.h"
#import "MSSharePointBaseODataContainer.h"

/**
* The header for type MSSharePointClient.
*/

@interface MSSharePointClient : MSSharePointBaseODataContainer

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSDependencyResolver>) resolver;
-(MSSharePointDriveFetcher*) getdrive;
-(MSSharePointItemCollectionFetcher*) getfiles;

@end
