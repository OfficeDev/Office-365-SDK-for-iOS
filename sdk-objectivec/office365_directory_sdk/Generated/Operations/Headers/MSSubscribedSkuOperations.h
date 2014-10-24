/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSubscribedSku.h"
#import "MSODataOperations.h"
#import "MSLicenseUnitsDetail.h"
#import "MSServicePlanInfo.h"

/**
* The header for type MSSubscribedSkuOperations.
*/


@interface MSSubscribedSkuOperations : MSODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

@end