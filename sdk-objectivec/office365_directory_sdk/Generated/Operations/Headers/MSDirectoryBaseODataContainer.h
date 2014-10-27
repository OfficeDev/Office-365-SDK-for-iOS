/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectoryODataExecutable.h"
#import <office365_odata_base/MSDependencyResolver.h>

/**
* The header for type MSDirectoryBaseODataContainer.
*/

@interface MSDirectoryBaseODataContainer : MSDirectoryODataExecutable

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSDependencyResolver>) resolver;

@end
