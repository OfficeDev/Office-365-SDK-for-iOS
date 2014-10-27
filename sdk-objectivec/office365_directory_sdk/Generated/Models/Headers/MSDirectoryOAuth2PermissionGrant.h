/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSDirectoryProtocols.h"


/**
* The header for type OAuth2PermissionGrant.
*/

@interface MSDirectoryOAuth2PermissionGrant : NSObject
@property NSString *$$__ODataType;
@property NSString *clientId;
@property NSString *consentType;
@property NSDate *expiryTime;
@property NSString *objectId;
@property NSString *principalId;
@property NSString *resourceId;
@property NSString *scope;
@property NSDate *startTime;

@end