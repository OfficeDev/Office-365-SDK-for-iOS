/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesODataExecutable.h"
#import <office365_odata_base/MSODependencyResolver.h>

/**
* The header for type MSFilesBaseODataContainer.
*/

@interface MSFilesBaseODataContainer : MSFilesODataExecutable

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSFilesDependencyResolver>) resolver;

@end
