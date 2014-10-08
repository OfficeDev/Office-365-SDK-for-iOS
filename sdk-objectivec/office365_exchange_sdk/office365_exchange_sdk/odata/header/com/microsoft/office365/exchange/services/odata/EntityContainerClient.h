/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "EntityContainerClient.h"
#import "BaseODataContainer.h"
#import "UserFetcher.h"

@interface EntityContainerClient : BaseODataContainer

-(id)initWit : (NSString*)url : (id<MSODependencyResolver>) resolver;

	
-(UserFetcher*) getMe;
@end
