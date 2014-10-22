/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

@class MSOApplicationInfo;
@class MSOUserInfo;

#import <Foundation/Foundation.h>
#import "MSOProtocols.h"


/**
* The header for type IdentitySet.
*/

@interface MSOIdentitySet : NSObject

@property MSOApplicationInfo *application;
@property MSOUserInfo *user;

@end