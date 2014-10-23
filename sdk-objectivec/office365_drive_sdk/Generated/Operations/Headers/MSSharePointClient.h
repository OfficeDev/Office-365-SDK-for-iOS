/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "MSDriveFetcher.h"

#import "MSItemCollectionFetcher.h"


#import "MSBaseODataContainer.h"

/**
* The header for type MSSharePointClient.
*/

@interface MSSharePointClient : MSBaseODataContainer

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSDependencyResolver>) resolver;
-(MSDriveFetcher*) getdrive;
-(MSItemCollectionFetcher*) getfiles;

@end
