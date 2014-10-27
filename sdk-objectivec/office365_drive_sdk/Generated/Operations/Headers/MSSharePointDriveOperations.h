/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSSharePointDrive.h"
#import "MSSharePointODataOperations.h"
#import "MSSharePointIdentity.h"
#import "MSSharePointDriveQuota.h"

/**
* The header for type MSSharePointDriveOperations.
*/


@interface MSSharePointDriveOperations : MSSharePointODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSSharePointODataExecutable>)parent;

@end