/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSDirectoryProtocols.h"


/**
* The header for type PasswordProfile.
*/

@interface MSDirectoryPasswordProfile : NSObject

@property NSString *$$__ODataType;
@property NSString *password;
@property bool forceChangePasswordNextLogin;

@end