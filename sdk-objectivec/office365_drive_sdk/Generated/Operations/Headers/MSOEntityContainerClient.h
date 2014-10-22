/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSODriveFetcher.h"
#import "MSOCurrentUserRequestContextFetcher.h"
#import "MSOItemCollectionFetcher.h"
#import "MSOBaseODataContainer.h"

/**
* The header for type MSOEntityContainerClient.
*/

@interface MSOEntityContainerClient : MSOBaseODataContainer

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSODependencyResolver>) resolver;
-(MSODriveFetcher*) getdrive;
-(MSOCurrentUserRequestContextFetcher*) getme;
-(MSOItemCollectionFetcher*) getfiles;

@end
