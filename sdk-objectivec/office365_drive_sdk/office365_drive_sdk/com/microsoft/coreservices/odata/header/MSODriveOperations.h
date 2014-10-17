/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSOODataOperations.h"
#import "MSODrive.h"
#import "MSOUserInfo.h"
#import "MSODriveQuota.h"


/**
* The header for type MSODriveOperations.
*/

@interface MSODriveOperations : MSOODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSOODataExecutable>)parent;

@end