/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDirectorySubscribedSku.h"
#import "MSDirectoryODataOperations.h"
#import "MSDirectoryLicenseUnitsDetail.h"
#import "MSDirectoryServicePlanInfo.h"

/**
* The header for type MSDirectorySubscribedSkuOperations.
*/


@interface MSDirectorySubscribedSkuOperations : MSDirectoryODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSDirectoryODataExecutable>)parent;

@end