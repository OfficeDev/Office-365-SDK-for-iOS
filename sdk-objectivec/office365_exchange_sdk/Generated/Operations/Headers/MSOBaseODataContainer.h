/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/
#import <Foundation/Foundation.h>
#import "MSOODataExecutable.h"
#import "MSOBaseODataContainerHelper.h"

/**
* The header for type MSOBaseODataContainer.
*/

@interface MSOBaseODataContainer : MSOODataExecutable

-(id)initWitUrl : (NSString *)url  dependencyResolver : (id<MSODependencyResolver>) resolver;

@end
