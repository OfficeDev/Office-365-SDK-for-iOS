/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import "MSFilesDrive.h"
#import "MSFilesODataOperations.h"
#import "MSFilesIdentity.h"
#import "MSFilesDriveQuota.h"

/**
* The header for type MSFilesDriveOperations.
*/


@interface MSFilesDriveOperations : MSFilesODataOperations

-(id)initWith:(NSString *)urlComponent :(id<MSFilesODataExecutable>)parent;

@end