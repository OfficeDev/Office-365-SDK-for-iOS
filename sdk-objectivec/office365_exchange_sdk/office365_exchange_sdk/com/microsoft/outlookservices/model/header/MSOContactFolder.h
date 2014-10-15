/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSOContact;
@class MSOContactFolder;

#import <Foundation/Foundation.h>
#import "MSOProtocols.h"
#import "MSOEntity.h"

/**
* The header for type ContactFolder.
*/

@interface MSOContactFolder : MSOEntity
@property NSString *ParentFolderId;
@property NSString *DisplayName;

@end