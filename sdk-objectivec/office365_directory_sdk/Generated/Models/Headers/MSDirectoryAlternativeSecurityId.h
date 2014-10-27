/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/


#import <Foundation/Foundation.h>
#import "MSDirectoryProtocols.h"


/**
* The header for type AlternativeSecurityId.
*/

@interface MSDirectoryAlternativeSecurityId : NSObject

@property NSString *$$__ODataType;
@property int type;
@property NSString *identityProvider;
@property NSData *key;

@end