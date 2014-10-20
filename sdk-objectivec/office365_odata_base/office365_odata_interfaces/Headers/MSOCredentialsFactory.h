/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSOCredentials.h"

@protocol MSOCredentialsFactory

@required
- (id<MSOCredentials>)getCredentials;

@end