/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSOutlookContact;
@class MSOutlookContactFolder;

#import <Foundation/Foundation.h>
#import "MSOutlookProtocols.h"
#import "MSOutlookEntity.h"

/**
* The header for type ContactFolder.
*/

@interface MSOutlookContactFolder : MSOutlookEntity
@property NSString *ParentFolderId;
@property NSString *DisplayName;

@end