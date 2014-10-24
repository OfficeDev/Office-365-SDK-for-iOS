/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "MSFilesDriveFetcher.h"

#import "MSFilesItemCollectionFetcher.h"


#import "MSFilesBaseODataContainer.h"

/**
* The header for type MSFilesClient.
*/

@interface MSFilesClient : MSFilesBaseODataContainer

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSFilesDependencyResolver>) resolver;
-(MSODriveFetcher*) getdrive;
-(MSOItemCollectionFetcher*) getfiles;

@end
