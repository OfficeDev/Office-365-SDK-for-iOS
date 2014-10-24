/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSFilesIdentity;

#import <Foundation/Foundation.h>
#import "MSOProtocols.h"


/**
* The header for type IdentitySet.
*/

@interface MSFilesIdentitySet : NSObject

@property MSOIdentity *application;
@property MSOIdentity *user;

@end