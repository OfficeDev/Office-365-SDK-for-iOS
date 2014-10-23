/*******************************************************************************
 * Copyright (c) Microsoft Open Technologies, Inc.
 * All Rights Reserved
 * See License.txt in the project root for license information.
 ******************************************************************************/

#import <Foundation/Foundation.h>
#import <office365_odata_base/office365_odata_interfaces.h>
#import "MSCredentials.h"
#import "MSCredentialsFactory.h"

@interface MSCredentialsImpl : NSObject<MSCredentialsFactory>
    
-(void)setCredentials : (id<MSCredentials>) credentials;

@end