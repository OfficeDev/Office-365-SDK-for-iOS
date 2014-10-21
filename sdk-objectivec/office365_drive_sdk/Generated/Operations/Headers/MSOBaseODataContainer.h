/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataExecutable.h"
#import <office365_odata_base/MSODependencyResolver.h>
/**
* The header for type MSOBaseODataContainer.
*/

@interface MSOBaseODataContainer : MSOODataExecutable

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSODependencyResolver>) resolver;

@end
