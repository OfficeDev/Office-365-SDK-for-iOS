/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSContact;
@class MSContactFolder;

#import <Foundation/Foundation.h>
#import "MSProtocols.h"
#import "MSEntity.h"

/**
* The header for type ContactFolder.
*/

@interface MSContactFolder : MSEntity
@property NSString *ParentFolderId;
@property NSString *DisplayName;

@end