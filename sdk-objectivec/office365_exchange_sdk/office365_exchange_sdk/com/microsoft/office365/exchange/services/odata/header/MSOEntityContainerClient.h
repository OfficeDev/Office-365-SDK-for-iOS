/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <office365_odata_interfaces/MSODependencyResolver.h>
#import "MSOBaseODataContainer.h"
#import "MSOUserFetcher.h"

#import "MSOUserCollectionFetcher.h"

@interface MSOEntityContainerClient  : MSOBaseODataContainer

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSODependencyResolver>) resolver;
-(MSOUserFetcher*) getMe;
-(MSOUserCollectionFetcher*) getUsers;

@end
