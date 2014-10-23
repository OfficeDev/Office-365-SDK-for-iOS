/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSDrive.h"
#import "MSODataOperations.h"
#import "MSIdentity.h"
#import "MSDriveQuota.h"

/**
* The header for type MSDriveOperations.
*/


@interface MSDriveOperations : MSODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSODataExecutable>)parent;

@end