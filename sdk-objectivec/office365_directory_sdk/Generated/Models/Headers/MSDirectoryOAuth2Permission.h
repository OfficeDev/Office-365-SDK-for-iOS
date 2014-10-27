/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSDirectoryProtocols.h"


/**
* The header for type OAuth2Permission.
*/

@interface MSDirectoryOAuth2Permission : NSObject

@property NSString *$$__ODataType;
@property NSString *adminConsentDescription;
@property NSString *adminConsentDisplayName;
@property NSString *id;
@property bool isEnabled;
@property NSString *type;
@property NSString *userConsentDescription;
@property NSString *userConsentDisplayName;
@property NSString *value;

@end