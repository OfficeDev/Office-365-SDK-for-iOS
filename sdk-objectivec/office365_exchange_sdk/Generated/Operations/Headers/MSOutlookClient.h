/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import "MSOutlookUserFetcher.h"

#import "MSOutlookUserCollectionFetcher.h"


#import "MSOutlookBaseODataContainer.h"

/**
* The header for type MSOutlookClient.
*/

@interface MSOutlookClient : MSOutlookBaseODataContainer

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSDependencyResolver>) resolver;
-(MSOutlookUserFetcher*) getMe;
-(MSOutlookUserCollectionFetcher*) getUsers;

@end
