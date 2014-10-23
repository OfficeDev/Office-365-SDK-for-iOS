/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSCredentials.h"

@protocol MSCredentialsFactory

@required
- (id<MSCredentials>)getCredentials;

@end