/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOutlookODataExecutable.h"
#import <office365_odata_base/MSDependencyResolver.h>

/**
* The header for type MSOutlookBaseODataContainer.
*/

@interface MSOutlookBaseODataContainer : MSOutlookODataExecutable

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSDependencyResolver>) resolver;

@end
