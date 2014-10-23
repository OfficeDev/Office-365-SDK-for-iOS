/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "MSUserFetcher.h"

#import "MSUserCollectionFetcher.h"


#import "MSBaseODataContainer.h"

/**
* The header for type MSOutlookClient.
*/

@interface MSOutlookClient : MSBaseODataContainer

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSDependencyResolver>) resolver;
-(MSUserFetcher*) getMe;
-(MSUserCollectionFetcher*) getUsers;

@end
