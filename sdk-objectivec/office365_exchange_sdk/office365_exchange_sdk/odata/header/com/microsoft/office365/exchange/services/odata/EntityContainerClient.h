/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "BaseODataContainer.h"
#import "UserFetcher.h"

@interface EntityContainerClient : BaseODataContainer

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSODependencyResolver>) resolver;

	
-(UserFetcher*) getMe;

@end